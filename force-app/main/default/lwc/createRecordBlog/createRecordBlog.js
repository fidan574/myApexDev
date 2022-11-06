import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import BLOG_OBJECT from '@salesforce/schema/Blog__c';
//UC:
//Create a blog form. If the user wants to stay ananymous then populate //the author name with "Ananymous User"
export default class CreateRecordBlog extends LightningElement {
    formdata = {};

    changeHandler(event) {
        const {name, value} = event.target;
        //const name = event.target.name;
        //const value = event.target.value;
        this.formdata[name] = value;
    }

    saveBlog() {
            //check if Author__c is populated
            //this.formdata['Author__c'] = "Ananymous User";
            if(this.formdata.Author__c == undefined || this.formdata.Author__c == null) {
                this.formdata.Author__c = "Ananymous User";
                //this.formdata['Author__c'] = "Ananymous User";
            }
            const recordInput = {
            apiName: BLOG_OBJECT.objectApiName,
            fields: this.formdata
        }
        createRecord(recordInput)
            .then(result => {
                console.log(result);
                //show a success message
                const successToast = new ShowToastEvent({
                    title: "Success!!",
                    message: "Blog has been saved successfully",
                    variant: "success"
                });
                this.dispatchEvent(successToast);
                this.resetBlog();
            })
            .catch(error=> {
                console.error(error);
            })
    }
        resetBlog() {
            //reset the form
            this.template.querySelector('form.blog').reset();
            //it cleans html datas
            this.formdata = {};
    }
}