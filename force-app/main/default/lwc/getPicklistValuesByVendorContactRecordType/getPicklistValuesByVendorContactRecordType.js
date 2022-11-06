import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class GetPicklistValuesByVendorContactRecordType extends LightningElement {
    vendorRtId;
    customerPriorityOptions = [];
    statusOptions = [];
    leadSourceOptions = [];
    selectedCustomerPriority;
    selectedStatus;
    selectedLeadSource;



    @wire(getObjectInfo, {objectApiName: CONTACT_OBJECT})
    ObjectInfoHandler({data,error}) {
        if(data){
            const rtids = data.recordTypeInfos;
            this.vendorRtId = Object.keys(rtids).find(rtid => rtids[rtid].name === "Vendor Contact");
        }
        if(error){
            console.error(error);
        }
    }
    
    @wire(getPicklistValuesByRecordType, {objectApiName:CONTACT_OBJECT , recordTypeId: '$vendorRtId'})
    PicklistHandler({data, error}) {
        if(data){
            console.log(data);
            // this.customerPriorityOptions = data.picklistFieldValues.Customer_Priority__c.values;
            // this.statusOptions = data.picklistFieldValues.Status__c.values;
            // this.leadSourceOptions = data.picklistFieldValues.LeadSource.values;

            this.customerPriorityOptions = this.picklistGenerator(data.picklistFieldValues.Customer_Priority__c);
            this.statusOptions = this.picklistGenerator(data.picklistFieldValues.Status__c);
            this.leadSourceOptions = this.picklistGenerator(data.picklistFieldValues.LeadSource);

        }
        if(error){
            console.error(error);
        }
    }
    changeHandler(event){
        const field = event.target.name;
        if (field === 'cpo') {
            this.selectedCustomerPriority = event.target.value;
        } else if (field === 'so') {
            this.selectedStatus = event.target.value;
        } else if (field === 'lso') {
            this.selectedLeadSource = event.target.value;
        }
    }
    picklistGenerator(info){
        return info.values.map(item=> ({
            label: item.label,
            value: item.value
        }));
    }

}