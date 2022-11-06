import { LightningElement, wire } from 'lwc';
import getTopAccounts from '@salesforce/apex/AccountCtrl.getTopAccounts';


const COLUMNS = [
    {label: "Account Name", fieldName: "Name", type: "text"},
    {label: "Account Type", fieldName: "Type", type: "text"},
    {label: "Industry", fieldName: "Industry", type: "text"},
    {label: "Annual Revenue", fieldName: "AnnualRevenue", type: "currency"}
]

export default class WiredApex1 extends LightningElement {

    accounts;
    columns = COLUMNS;

    @wire (getTopAccounts)
    recordsHandler({data, error}) {
        if(data) {
            this.accounts = data;
        }
        if(error){
            console.error(error);
        }
    }

}