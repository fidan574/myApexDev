import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import ACCOUNT_NAME from  '@salesforce/schema/Opportunity.AccountId';
import OPPORTUITY_NAME from '@salesforce/schema/Opportunity.Name';
import TYPE from '@salesforce/schema/Opportunity.Type';
import STAGE_NAME from '@salesforce/schema/Opportunity.StageName';
import AMOUNT from '@salesforce/schema/Opportunity.Amount';

export default class LightningRecordFormOpportunity extends LightningElement {
    recordId = "0067Q00000ARuZXQA1";
    objectName = OPPORTUNITY_OBJECT;
    // layoutType = "Compact";
    fields = [ACCOUNT_NAME, OPPORTUITY_NAME, TYPE, STAGE_NAME, AMOUNT];

    successHandler() {
        const successToast = new ShowToastEvent({
            title: "Success!!",
            message: "The opportunity record has been saved successfully",
            variant: "success"
        });
        this.dispatchEvent(successToast);

    }
}