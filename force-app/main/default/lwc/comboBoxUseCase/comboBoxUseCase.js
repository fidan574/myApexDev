import { LightningElement } from 'lwc';

export default class ComboBoxUseCase extends LightningElement {
    value;

    get options(){
        return [
            { label: 'New', value: 'New' },
            { label: 'In Progress', value: 'In Progress' },
            { label: 'Finished', value: 'Finished' }
        ];
    }

    handleChange(event) {
        console.log(event);
        this.value = event.detail.value;
    }
}