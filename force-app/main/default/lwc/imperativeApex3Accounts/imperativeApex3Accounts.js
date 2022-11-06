import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import getAccountByIndustryImperative from '@salesforce/apex/AccountCtrl.getAccountByIndustryImperative';

const COLUMNS = [
    {label: "Account Name", fieldName: "Name", type: "text"},
    {label: "Account Type", fieldName: "Type", type: "text"},
    {label: "Industry", fieldName: "Industry", type: "text"},
    {label: "Annual Revenue", fieldName: "AnnualRevenue", type: "currency"}
]

export default class ImperativeApex3 extends LightningElement {

    accountRtId;
    error;
    industryOptions = [];
    selectedIndustry;
    accounts;
    columns = COLUMNS;

    @wire(getObjectInfo, {objectApiName:ACCOUNT_OBJECT})
    objectInfoHandler({data, error}) {
        if(data){
            this.accountRtId = data.defaultRecordTypeId
        }
        if(error){
            this.error = error;
        }
        
    }

    @wire(getPicklistValues, {fieldApiName:INDUSTRY_FIELD,recordTypeId: '$accountRtId'})
    picklistHandler({data, error}) {
        if(data){
            this.industryOptions = data.values;
        }
        if(error){
            this.error = error;
        }
    }    

    searchHandler(event) {
        this.selectedIndustry = event.target.value;
        console.log(this.selectedIndustry);
        getAccountByIndustryImperative({industry: this.selectedIndustry})
            .then(result=> {
                console.log(result);
                this.accounts = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.contacts = undefined;
            })
        
    }
} 