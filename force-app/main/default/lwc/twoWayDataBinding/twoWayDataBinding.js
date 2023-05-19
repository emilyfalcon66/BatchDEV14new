import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {
    fullName = "Emily";
    title = "Salesforce Developer";
    age = 37;

    titleChangeHandler(event){
        this.title = event.target.value;
    }
}