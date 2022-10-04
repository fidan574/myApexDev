import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {
    name; //undefined
    fullName = "Salesforce Developer";
    age = 30; 
    location = {
        city: "Houston",
        country: "United States",
        postalCode: "50033"
    };
    fruits = ["Banana", "Apple", "Grape", "Dragon", "Mango"];
}