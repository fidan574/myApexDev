import { LightningElement } from 'lwc';

export default class P2cPrimativesParentAssignment extends LightningElement {
    clickHandler() {
        
        const ffelem = this.template.querySelector('.favFruit');
        console.log(ffelem.innerText);
        ffelem.style.color = 'black';
        ffelem.style.border = '10px solid black';
        ffelem.style.backgroundColor = 'yellow';
    }
}