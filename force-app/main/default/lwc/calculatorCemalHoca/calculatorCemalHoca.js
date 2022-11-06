import { LightningElement, track } from 'lwc';

export default class CalculatorCemalHoca extends LightningElement {
    @track result;
    num1;
    num2;@track result;
    num1;
    num2;

    elinleDegerGirdiginde(event) {
        const name = event.target.name;
        if (name === 'Number1') {
            this.num1 = event.target.value;
        } else if (name === 'Number2') {
            this.num2 = event.target.value;
        }
    }

    butonaTiklattigida(event) {
        var operation = event.target.label;
        if (!isNaN(this.num1) && !isNaN(this.num2)) {
            const numb1 = parseInt(this.num1, 10);
            const numb2 = parseInt(this.num2, 10);
            var tempResult = 0;
            if (operation === 'Toplama') {
                tempResult = `${numb1 + numb2}`;
            } else if (operation === 'Cikarma') {
                tempResult = `${numb1 - numb2}`;
            } else if (operation === 'Carpma') {
                tempResult = `${numb1 * numb2}`;
            } else if (operation === 'Bolme') {
                tempResult = `${numb1 / numb2}`;
            }
            if (tempResult !== null && tempResult !== '' && tempResult !== undefined && !isNaN(tempResult)) {
                this.result = tempResult;
            }
        }
    }

    elinleDegerGirdiginde(event) {
        const name = event.target.name;
        if (name === 'Number1') {
            this.num1 = event.target.value;
        } else if (name === 'Number2') {
            this.num2 = event.target.value;
        }
    }

    butonaTiklattigida(event) {
        var operation = event.target.label;
        if (!isNaN(this.num1) && !isNaN(this.num2)) {
            const numb1 = parseInt(this.num1, 10);
            const numb2 = parseInt(this.num2, 10);
            var tempResult = 0;
            if (operation === 'Toplama') {
                tempResult = `${numb1 + numb2}`;
            } else if (operation === 'Cikarma') {
                tempResult = `${numb1 - numb2}`;
            } else if (operation === 'Carpma') {
                tempResult = `${numb1 * numb2}`;
            } else if (operation === 'Bolme') {
                tempResult = `${numb1 / numb2}`;
            }
            if (tempResult !== null && tempResult !== '' && tempResult !== undefined && !isNaN(tempResult)) {
                this.result = tempResult;
            }
        }
    }
}