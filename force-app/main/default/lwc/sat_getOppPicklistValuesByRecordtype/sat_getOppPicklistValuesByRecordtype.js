import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';


import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
export default class sat_getOppPicklistValuesByRecordtype extends LightningElement {

        oppRtId;
        stageNameOptions = [];
        typeOptions = [];
        opportunityName;
        selectedStageName;
        selectedType;
    
        @wire(getObjectInfo, {objectApiName: OPPORTUNITY_OBJECT})
        ObjectInfoHandler({data,error}) {
            if(data){
                this.oppRtId = data.defaultRecordTypeId;
            }
            if(error){
                console.error(error);
            }
        }
        
        @wire(getPicklistValuesByRecordType, {objectApiName:OPPORTUNITY_OBJECT , recordTypeId: '$oppRtId'})
        PicklistHandler({data, error}) {
            if(data){
                console.log(data);
                this.stageNameOptions = data.picklistFieldValues.StageName.values;
                this.typeOptions = data.picklistFieldValues.Type.values;
            }
            if(error){
                console.error(error);
            }
        }
        changeHandler(event) {
            switch (event.target.label) {
                case "Enter Opportunity Name...":
                    this.opportunityName = event.target.value;
                    break;
                case "Select Stage Name...":
                    this.selectedStageName = event.target.value;
                    break;
                case "Select Type...":
                    this.selectedType = event.target.value;
                    break;
                default:
                    break;
            }
        }
}