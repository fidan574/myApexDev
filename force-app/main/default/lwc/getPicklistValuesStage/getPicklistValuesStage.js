import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
export default class GetPicklistValuesStage extends LightningElement {

    oppRtId;
    stageOptions = [];
    selectedStages;
    

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

    @wire(getPicklistValues, {fieldApiName: STAGE_FIELD, recordTypeId: '$oppRtId' })
    PicklistHandler({data, error}) {
        if(data){
            console.log(data);
            this.stageOptions = data.values;
        }
        if(error){
            console.error(error);
        }
    }
    changeHandler(event){
        this.selectedStages = event.target.value;
    }

}