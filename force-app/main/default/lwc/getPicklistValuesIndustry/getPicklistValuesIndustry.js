import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACCOUNT_FIELD from '@salesforce/schema/Account';
export default class GetPicklistValuesIndustry extends LightningElement {
    
    AccountRtId;
    industryOptions = [];
    selectedIndustry;
    
    @wire(getObjectInfo, {objectApiName: ACCOUNT_FIELD})
    objectInfoHandler({data,error}) {
        if(data){
            console.log(data);
            this.AccountRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.error(error);
        }
    }

    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$AccountRtId'})
    PicklistHandler({data, error}) {
        if(data){
            console.log(data);
            this.industryOptions = data.values;
        }
        if(error){
            console.error(error);
        }
    }
    changeHandler(event){
        this.selectedIndustry = event.target.value;
    }
    
}