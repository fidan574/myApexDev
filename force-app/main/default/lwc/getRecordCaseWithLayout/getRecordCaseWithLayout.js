import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_FIELD from '@salesforce/schema/Case.Account.Name';
import CONTACT_FIELD from '@salesforce/schema/Case.Contact.Name';
import CASE_NUMBER_FIELD from '@salesforce/schema/Case.CaseNumber';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';


export default class GetRecordCaseWithLayout extends LightningElement {
    recordId = "5007Q00000DfeYZQAZ";
    cs;

    @wire(getRecord, {recordId: '$recordId', layoutTypes: ['Full'], modes: ['View']})
    recordHandler({data, error}){
        if(data){
            console.log(data);
            this.cs = data;
        }
        if(error){
            console.error(error);
        }
    }
    get account() {
        return getFieldValue(this.cs, ACCOUNT_FIELD);
    }
    get contact() {
        return getFieldValue(this.cs, CONTACT_FIELD);
    }
    get caseNumber() {
        return getFieldValue(this.cs, CASE_NUMBER_FIELD);
    }
    get subject() {
        return getFieldValue(this.cs, SUBJECT_FIELD);
    }
}