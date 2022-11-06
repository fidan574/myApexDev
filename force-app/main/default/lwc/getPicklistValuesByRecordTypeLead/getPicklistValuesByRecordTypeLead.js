import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import LEAD_OBJECT from '@salesforce/schema/Lead';

export default class GetPicklistValuesByRecordTypeLead extends LightningElement {

    leadRtId;
    industryOptions = [];
    ratingOptions = [];
    statusOptions = [];
    leadSourceOptions = [];
    selectedIndustry;
    selectedRating;
    selectedLeadSource;
    selectedStatus;



    @wire(getObjectInfo, {objectApiName: LEAD_OBJECT})
    ObjectInfoHandler({data,error}) {
        if(data){
            this.leadRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.error(error);
        }
    }
    
    @wire(getPicklistValuesByRecordType, {objectApiName:LEAD_OBJECT , recordTypeId: '$leadRtId'})
    PicklistHandler({data, error}) {
        if(data){
            console.log(data);
            this.industryOptions = data.picklistFieldValues.Industry.values;
            this.ratingOptions = data.picklistFieldValues.Rating.values;
            this.statusOptions = data.picklistFieldValues.Status.values;
            this.leadSourceOptions = data.picklistFieldValues.LeadSource.values;

        }
        if(error){
            console.error(error);
        }
    }
    changeHandler(event) {
        switch (event.target.label) {
            case "Select Industry...":
                this.selectedIndustry = event.target.value;
                break;
            case "Select Rating...":
                this.selectedRating = event.target.value;
                break;
            case "Select Lead Source...":
                this.selectedLeadSource = event.target.value;
                break;
            case "Select Status...":
                this.selectedStatus = event.target.value;
                break;
            default:
                break;
        }
    }

}