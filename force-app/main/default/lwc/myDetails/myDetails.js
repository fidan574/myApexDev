import { LightningElement } from 'lwc';

export default class MyDetails extends LightningElement {
    userName;
    role;
    country;

    nameHandleChange(event){
        this.userName = event.target.value;
    }
    coHandleChange(event){
        this.country = event.target.value;
    }


    get RoleOptions(){
        return [
            { label: 'Salesforce Admin', value: 'Salesforce Admin' },
            { label: 'Salesforce Developer', value: 'Salesforce Developer' },
            { label: 'Salesforce Architect', value: 'Salesforce Architect' }
        ];
    }

    handleChange(event) {
        console.log(event);
        this.role = event.detail.value;
    }
}