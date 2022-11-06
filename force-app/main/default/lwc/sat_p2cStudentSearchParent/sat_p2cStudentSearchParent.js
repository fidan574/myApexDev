import searchStudentByPostalCode from '@salesforce/apex/StudentCtrl.searchStudentByPostalCode';
import { LightningElement } from 'lwc';
const COLUMNS = [
    {label: "Student Name", fieldName: "Student_Name__c", type: "text"},
    {label: "Class", fieldName: "Class__c", type: "text"},
    {label: "Mobile", fieldName: "Mobile__c", type: "text"},
    {label: "Email", fieldName: "Email__c", type: "text"},
    {label: "Postal Code", fieldName: "Postal_Code__c", type: "text"}
];

export default class Sat_p2cStudentSearchParent extends LightningElement {
    
    searchCode;
    students;
    error;
    columns = COLUMNS;

    changeHandler(event){
        this.searchCode = event.target.value;

        if(this.searchCode.length > 0){
            searchStudentByPostalCode({searchKey: this.searchCode})
            .then(result => {
                if(result.length==0) {
                    this.error = "There is no matching student found. Try another key words!";
                    this.students = undefined;
                } else {
                    this.students = result;
                    this.error = undefined;
                }
            })
            .catch(error => {
                this.error = error;
                this.students = undefined;
            })
        } else {
            this.error = "Please enter some key numbers to search!"
            this.students = undefined;
        }
    }
}