import { LightningElement, wire } from 'lwc';
import getTopOpps from '@salesforce/apex/OpportunityCtrl.getTopOpps';

const COLUMNS = [
    {label: "Opportunity Name", fieldName: "Name", type: "text"},
    {label: "Opportunity Type", fieldName: "Type", type: "text"},
    {label: "Stage Name", fieldName: "StageName", type: "text"},
    {label: "Amount", fieldName: "Amount", type: "currency"}
]

export default class As_wiredApexOpp1 extends LightningElement {

    opps;
    columns = COLUMNS;

    @wire (getTopOpps)
    recordsHandler({data, error}) {
        if(data) {
            this.opps = data;
        }
        if(error){
            console.error(error);
        }
    }
}