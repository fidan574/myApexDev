import { LightningElement } from 'lwc';

export default class QuerySelectorsDemo extends LightningElement {

    cities = ["Houston", "Fawley", "Miami", "Orlando", "Istanbul"];

    clickHandler() {
        //querySelector demo - h1
        const h1elem = this.template.querySelector('h1');
        console.log(h1elem.innerText);
        h1elem.style.color = 'green';
        h1elem.style.border = '2px solid red';
        h1elem.style.backgroundColor = 'yellow';

        //querySelector demo - p
        const pelem = this.template.querySelector("p");
        console.log(pelem);
        pelem.style.backgroundColor = 'blue';
        pelem.style.color = 'pink';
        pelem.style.border = '10px double black';

         //querySelectorAll demo 
    const divelem = this.template.querySelectorAll('.city');
    divelem.forEach(item => {
        console.log(item.innerText);
        item.style.color = 'white';
        item.style.backgroundColor = 'purple';
        item.style.border = '10px double yellow';
        item.setAttribute("class", "slds-align_absolute-center")
    })
    }

}

    