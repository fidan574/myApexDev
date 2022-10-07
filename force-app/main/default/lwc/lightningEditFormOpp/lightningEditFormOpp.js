import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import OPP_OBJECT from '@salesforce/schema/Opportunity';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import CLOSE_DATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';


export default class LightningEditFormOpp extends LightningElement {

    recordId = "0067Q00000ARuZXQA1";
    objectName = OPP_OBJECT;
    fields = {
        account: ACCOUNT_FIELD,
        name: NAME_FIELD,
        stage: STAGE_FIELD,
        type: TYPE_FIELD,
        amount: AMOUNT_FIELD,
        closeDate: CLOSE_DATE_FIELD
    };
    successHandler() {
        const successToast = new ShowToastEvent({
            title: "Success!!",
            message: "The opportunity record has been updated successfully.",
            variant: "success"
        });
        this.dispatchEvent(successToast);

    }
}