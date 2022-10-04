import { LightningElement } from 'lwc';

export default class TwoWayBinding extends LightningElement {
    name="Zeynep";

    handleChange(event){
        this.name = event.target.value;
    }
}