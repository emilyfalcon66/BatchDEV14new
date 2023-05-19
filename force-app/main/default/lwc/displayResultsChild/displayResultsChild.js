import { LightningElement, api } from 'lwc';

export default class DisplayResultsChild extends LightningElement {
    @api records;
    @api columns;
    @api error;
}