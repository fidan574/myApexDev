import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import LEAD_OBJECT from '@salesforce/schema/Lead';


export default class Sat_createLeadForm extends LightningElement {
    formdata = {};

    changeHandler(event) {
        const {name, value} = event.target;
        //const name = event.target.name;
        //const value = event.target.value;
        this.formdata[name] = value;
    }
    
    saveLead() {
        const recordInput = {
            apiName: LEAD_OBJECT.objectApiName,
            fields: this.formdata
        }
        createRecord(recordInput)
            .then(result => {
                console.log(result);
                //show a success message
                const successToast = new ShowToastEvent({
                    title: "Success!!",
                    message: "Lead has been saved successfully",
                    variant: "success"
                });
                this.dispatchEvent(successToast);
                //reset the form
                this.resetLead();
            })
            .catch(error=> {
                console.error(error);
            })
    }
    resetLead() {
        //reset the form
        this.template.querySelector('form.lead').reset();
        //it cleans html datas
        this.formdata = {};
}
}