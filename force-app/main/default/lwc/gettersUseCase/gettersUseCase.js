import { LightningElement } from 'lwc';

export default class GettersUseCase extends LightningElement {
    fruits = ['Orange', 'Kivi', 'Apple', 'Banana'];
    num1 = 30;
    num2 = 20;
    get firstFruit() {
        return this.fruits[1];
    }

    get sum(){
        return this.num1+this.num2;
    }
}