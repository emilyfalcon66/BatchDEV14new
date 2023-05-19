import { LightningElement } from 'lwc';

export default class MyNameAndRole extends LightningElement {
    number1;
    number2;
    get sumOfNumbers(){
        return  this.sum = parseInt(this.number1) + parseInt(this.number2);
    }

number1ChangeHandler(event) {
    this.number1 = event.target.value;  
}
number2ChangeHandler(event) {
    
    this.number2 = event.target.value;
   
}

}