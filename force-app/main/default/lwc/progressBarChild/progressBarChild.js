import { LightningElement, api } from 'lwc';

export default class ProgressBarChild extends LightningElement {
    @api progressValue;
    @api progressSize;

    @api resetProgress(){
        this.progressValue = 50;
    }
}