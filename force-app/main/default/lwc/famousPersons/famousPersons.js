import { LightningElement } from 'lwc';

export default class FamousPersons extends LightningElement {
    contacts = [
        {
        name : "Jeff Bezos", 
        title : "Executive Chairman", 
        company : "Amazon", 
        stay : "United States"
        },
        
        {
        name : "Sundar Pichai", 
        title : "Chief Executive Officer", 
        company : "Google", 
        stay : "United States"
        },

        {
        name : "Tim Cook", 
        title : "Chief Executive Officer", 
        company : "Apple", 
        stay : "United States"
        },

        {
        name : "Mark Zuckerber", 
        title : "Chief Executive Officer", 
        company : "Facebook", 
        stay : "United States"
        },
    ];
}