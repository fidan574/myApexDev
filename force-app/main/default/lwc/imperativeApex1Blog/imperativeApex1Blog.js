import { LightningElement } from 'lwc';
import getAllBlogs from '@salesforce/apex/BlogCntrl.getAllBlogs';

const COLUMNS = [
    {
        label:"Blog#",
        fieldName:"nameUrl",
        type:"url",
        typeAttributes: {
            label: {fieldName: "Name"}
            //target: "_blank"
        },
        //sortable: true;
    },
    {
        label:"Author",
        fieldName:"Author__c",
        type:"text"
    },
    {
        label:"Topic",
        fieldName:"Topic__c",
        type:"text"
    },
    {
        label:"Title",
        fieldName:"Title__c",
        type:"text"
    },
    {
        label:"Body Content",
        fieldName:"Body__c",
        type:"text"
    }
];

export default class ImperativeApex1Blog extends LightningElement {
    
    blogs;
    error;
    columns = COLUMNS;

    fetchBlogs() {
        getAllBlogs() 
            .then(result => {
                console.log(result);
              //this.blogs = result;
                let nameUrl;
                this.blogs = result.map(blog => {
                    nameUrl = "/" + blog.Id;
                    return {...blog, nameUrl}
            });
                this.error = undefined;
            })
            .catch(error => {
                console.error(error);
                this.error = error;
                this.blogs = undefined;
            })
    }
}
