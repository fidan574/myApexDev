import { LightningElement, wire } from 'lwc';

import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';

const FIELDS = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, REVENUE_FIELD, RATING_FIELD, PHONE_FIELD];

export default class GetRecordAccount extends LightningElement {
    recordId = "0017Q00000RXnXFQA1";
    account;
    
    @wire(getRecord, {recordId: '$recordId', fields:FIELDS})
    recordHandler({data, error}){
        if(data){
            console.log(data);
            this.account = data;
        }
        if(error){
            console.error(error);
        }
    }
    
    get name() {
        return getFieldValue(this.account, NAME_FIELD);
    }

    get type() {
        return getFieldDisplayValue(this.account, TYPE_FIELD);
        // const value = getFieldDisplayValue(this.account, TYPE_FIELD);
        // if(value === "Existing Customer - Upgrade"){
        //     return "Existing Customer";
        // }
    }

    get industry() {
        return getFieldDisplayValue(this.account, INDUSTRY_FIELD);
    }

    get revenue() {
        return getFieldDisplayValue(this.account, REVENUE_FIELD);
    }

    get rating() {
        return getFieldDisplayValue(this.account, RATING_FIELD);
    }

    get phone() {
        return getFieldValue(this.account, PHONE_FIELD);
    }
}