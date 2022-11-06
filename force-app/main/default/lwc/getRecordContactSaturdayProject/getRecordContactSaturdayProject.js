import { LightningElement, wire } from 'lwc';
import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import MOBILE_FIELD from '@salesforce/schema/Contact.MobilePhone';
import DEPARTMENT_FIELD from '@salesforce/schema/Contact.Department';

const FIELDS = [NAME_FIELD, TITLE_FIELD, EMAIL_FIELD, MOBILE_FIELD, DEPARTMENT_FIELD];
export default class GetRecordContactSaturdayProject extends LightningElement {
    recordId = "0037Q00000LJsRMQA1";
    contact;
    
    @wire(getRecord, {recordId: '$recordId', fields:FIELDS})
    recordHandler({data, error}){
        if(data){
            console.log(data);
            this.contact = data;
        }
        if(error){
            console.error(error);
        }
    }
    
    get name() {
        return getFieldValue(this.contact, NAME_FIELD);
    }

    get title() {
        return getFieldValue(this.contact, TITLE_FIELD);
        // const value = getFieldDisplayValue(this.contact, TYPE_FIELD);
        // if(value === "Existing Customer - Upgrade"){
        //     return "Existing Customer";
        // }
    }

    get email() {
        return getFieldValue(this.contact, EMAIL_FIELD);
    }

    get mobile() {
        return getFieldValue(this.contact, MOBILE_FIELD);
    }

    get department() {
        return getFieldValue(this.contact, DEPARTMENT_FIELD);
    }
}