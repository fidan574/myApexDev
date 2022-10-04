import { LightningElement } from 'lwc';

export default class ConditioalRendering2 extends LightningElement {
    showData = true;
    details= {
        fullName: "Zeynep Fidan",
        place: "Gelsenkrichen"
    };

    clickHandler() {
        this.showData = !this.showData;
    }
}