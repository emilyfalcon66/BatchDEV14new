import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {
    name; //undefined
    fullName= "Emily";
    age= 37;
    location={
        city: "Houston",
        country:"United States",
        postalCode:"77494"
    }
    birds= ["Crow", "Swan", "Sparrow", "Peacock"];
}