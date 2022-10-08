import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {
    num1;
    num2 ;
    totalNumber ;
    handleChange(event){
        if (event.target.name === 'number1')
        this.num1 = event.target.value;
        if(event.target.name === 'number2')
        this.num2 = event.target.value;
        if(this.num1 == undefined)
        this.num1 = 0;
        if(this.num2 == undefined)
        this.num2 = 0;
        this.totalNumber = Number(this.num1) + Number(this.num2);
    }
}