import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import OPP_OBJECT from '@salesforce/schema/Opportunity';
import LEAD_SOURCE_FIELD from '@salesforce/schema/Opportunity.LeadSource';

export default class GetPicklistValuesLeadSource extends LightningElement {
    
    oppRtId;
    leadSourceOptions = [];
    selectedLeadSource;
    

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    ObjectInfoHandler({data,error}) {
        if(data){
            console.log(data);
            this.oppRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.error(error);
        }
    }

    @wire(getPicklistValues, {fieldApiName: LEAD_SOURCE_FIELD, recordTypeId: '$oppRtId' })
    PicklistHandler({data, error}) {
        if(data){
            console.log(data);
            this.leadSourceOptions = data.values;
        }
        if(error){
            console.error(error);
        }
    }
    changeHandler(event){
        this.selectedLeadSource = event.target.value;
    }

}