import { LightningElement, wire } from 'lwc';
import { getFieldValue, getRecord, updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import FIRST_NAME_FIELD from '@salesforce/schema/Lead.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Lead.LastName';
import COMPANY_FIELD from '@salesforce/schema/Lead.Company';
import TITLE_FIELD from '@salesforce/schema/Lead.Title';
import EMAIL_FIELD from '@salesforce/schema/Lead.Email';


const FIELDS = [FIRST_NAME_FIELD, LAST_NAME_FIELD, COMPANY_FIELD, TITLE_FIELD, EMAIL_FIELD];

export default class UpdateRecordLead extends LightningElement {
    recordId = "00Q7Q000005XC2JUAW";
    lead;
    formdata = {};

    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    recordHandler({data, error}) {
        if(data) {
            this.lead = data;
        }
        if(error) {
            console.error(error);
        }
    }

    get firstName() {
        return getFieldValue(this.lead, FIRST_NAME_FIELD);
    }

    get lastName() {
        return getFieldValue(this.lead, LAST_NAME_FIELD);
    }

    get company() {
        return getFieldValue(this.lead, COMPANY_FIELD);
    }

    get title() {
        return getFieldValue(this.lead, TITLE_FIELD);
    }

    get email() {
        return getFieldValue(this.lead, EMAIL_FIELD);
    }

    changeHandler(event) {
        const {name, value} = event.target;
        this.formdata[name] = value;
    }

    updateLead() {
        this.formdata['Id'] = this.recordId;
        //this.formdata.Id = this.recordId;
        const recordInput = {
            fields: this.formdata
        };

        updateRecord(recordInput)
            .then(result => {
                console.log(result);
                const successToast = new ShowToastEvent({
                    title: "Success",
                    message: "Your lead has been updated successfully!",
                    variant: "success"
                });
                this.dispatchEvent(successToast);
            })
            .catch(error => {
                console.error(error);
            })
    }
}

//First Name, Last Name, Email, Title, Department & Company)