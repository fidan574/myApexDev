import { LightningElement, wire } from 'lwc';
import getOppByStageName from '@salesforce/apex/OpportunityCtrl.getOppByStageName';

const COLUMNS = [
    {label: "Opportunity Name", fieldName: "Name", type: "text"},
    {label: "Opportunity Type", fieldName: "Type", type: "text"},
    {label: "Stage Name", fieldName: "StageName", type: "text"},
    {label: "Amount", fieldName: "Amount", type: "currency"}
]
export default class As_wiredApexOpp2 extends LightningElement {
    stagename = "Prospecting";
    opps;
    columns = COLUMNS;

    @wire(getOppByStageName, {stageName: '$stagename'})
    recordsHandler({data, error}) {
        if(data) {
            console.log(data);
            this.opps = data;
        }
        if(error){
            console.error(error);
        }
    }

    get total() {
        if(this.opps) {
            return this.opps.length;
        } else {
            return 0;
        }
        
    }
}