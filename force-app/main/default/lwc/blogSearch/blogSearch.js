import getBlogsByTopic from '@salesforce/apex/BlogCntrl.getBlogsByTopic';
import getTopicNames from '@salesforce/apex/BlogCntrl.getTopicNames';
import { LightningElement, wire } from 'lwc';

const COLUMNS = [
    {label: "Name", fieldName: "Name", type: "text"},
    {label: "Author", fieldName: "Author__c", type: "text"},
    {label: "Topic", fieldName: "Topic__c", type: "text"},
    {label: "Title", fieldName: "Title__c", type: "text"},
    {label: "Content", fieldName: "Body__c", type: "text"}
];

export default class BlogSearch extends LightningElement {
    
    
    topicOptions = [];
    selectedTopic;
    blogs;
    columns = COLUMNS;
    error;

    @wire(getTopicNames)
    topicsHandler({data, error}) {
        if(data) {
            this.topicOptions = this.picklistHandler(data);
        }
        if(error) {
            this.error = error;
        }
    }

    picklistHandler(data) {
        return data.map(item=> ({
            label: item,
            value: item
        }));
    }

    changeHandler(event) {
        this.selectedTopic = event.target.value;
        getBlogsByTopic({topic: this.selectedTopic})
            .then(result => {
                this.blogs = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.blogs = undefined;
            })
    }
}