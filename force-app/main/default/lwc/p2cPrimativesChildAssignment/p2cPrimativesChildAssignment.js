import { api, LightningElement } from 'lwc';

export default class P2cPrimativesChildAssignment extends LightningElement {
    @api favFruit;
    @api cityAvailable;
    @api timesAte;
}