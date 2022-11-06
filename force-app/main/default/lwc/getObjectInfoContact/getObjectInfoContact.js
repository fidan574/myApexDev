import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class GetObjectInfoContact extends LightningElement {

    customerRtId;
    vendorRtId;
    url;

    @wire(getObjectInfo, {objectApiName: CONTACT_OBJECT})
    objectInfoHandler({data, error}) {
        if(data) {
            console.log(data);
            this.customerRtId = data.defaultRecordTypeId;
            const rtids = data.recordTypeInfos;
            this.vendorRtId = Object.keys(rtids).find(rtid => rtids[rtid].name === "Vendor Contact");
            this.url = data.themeInfo.iconUrl;

        }
        if(error) {
            console.log(error);
        }
    }

}