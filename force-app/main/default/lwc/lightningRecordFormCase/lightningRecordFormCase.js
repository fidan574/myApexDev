import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CASE_OBJECT from '@salesforce/schema/Case';

export default class LightningRecordFormCase extends LightningElement {
    recordId = "5007Q00000DfnsbQAB";
    objectName = CASE_OBJECT;
    layoutType = "Compact";


    successHandler() {
        const successToast = new ShowToastEvent({
            title: "Success!!",
            message: "The case record has been saved successfully",
            variant: "success"
        });
        this.dispatchEvent(successToast);

    }
}