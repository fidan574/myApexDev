import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import BLOG_OBJECT from '@salesforce/schema/Blog__c.';

export default class GetObjectInfoBlog extends LightningElement {
    
    storyRtId;
    lessonRtId;

    @wire(getObjectInfo, {objectApiName: BLOG_OBJECT})
    ObjectInfoHandler({data, error}) {
        if(data) {
            console.log(data);
            this.storyRtId = data.defaultRecordTypeId;
            const rtids = data.recordTypeInfos;
            this.lessonRtId = Object.keys(rtids).find(rtid => rtids[rtid].name === "Lesson");
        }
        if(error) {
            console.log(error);
        }
    }
}