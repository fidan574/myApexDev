import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { createRecord, deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountCreateAndDelete extends LightningElement {
    accountRtId;
    createForm = false;
    deleteForm = false;
    industryOptions =[];
    selectIndustry;
    recordId = '0017Q00000dqKWxQAM';
    formdata = {};

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    objectInfoHandler({data, error}){
        if (data) {
            console.log(data);
            this.accountRtId = data.defaultRecordTypeId;
        }
        if (error) {
            console.error(error);
        }
    }

    @wire(getPicklistValuesByRecordType, {objectApiName: ACCOUNT_OBJECT, recordTypeId:'$accountRtId'})
    picklistHandler({data, error}){
        if (data) {
            console.log(data);
            this.industryOptions = data.picklistFieldValues.Industry.values;
        }
        if (error) {
            console.error(error);
        }
    }

    changeHandler(event){
        const {name, value} = event.target;
        this.formdata[name] = value;
    }
    createHandler(){
        this.createForm = !this.createForm;
    }
    deleteHandler(){
        this.deleteForm = !this.deleteForm;
    }

    saveAccount(){
        const recordInput = {
            apiName: ACCOUNT_OBJECT.objectApiName,
            fields: this.formdata
        }

        createRecord(recordInput)
            .then(result => {
                console.log(result);
                this.createForm = !this.createForm;
                // const successToast = new ShowToastEvent({
                //     title: 'Success',
                //     message: 'Account recordu orga kaydedildi...',
                //     variant: 'success'
                // });
                // this.dispatchEvent(successToast);
                this.displayToast("Success","Account recordu orga kaydedildi...","success");
            })
            .catch(error => {
                console.error(error);
            })
    }
    changeHandlerDel(event) {
        this.recordId = event.target.value;
    }
    
    deleteRec() {
        const recordId = this.recordId;
        deleteRecord(recordId)
        .then(result => {
            console.log(result);
            this.deleteForm = !this.deleteForm;
            //const successToast = new ShowToastEvent({
            //     title: "Success!!",
            //     message: "Record has been deleted!",
            //     variant: "warning"
            // });
            // this.dispatchEvent(successToast);
            this.displayToast("Success","Record has been deleted","warning");
        })
        .catch(error => {
            console.error(error);
            // const errorToast = new ShowToastEvent({
            //     title: "Error",
            //     message: "error.body.message",
            //     variant: "error"
            // });
            // this.dispatchEvent(errorToast);
            this.displayToast("Error", error.body.message, "error");
        })  
    }
    
    displayToast(title, message, variant) {
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }
}