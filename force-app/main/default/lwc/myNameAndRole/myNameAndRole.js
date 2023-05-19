import { LightningElement } from 'lwc';

export default class MyNameAndRole extends LightningElement {
    number1;
    number2;
    get sumOfNums(){
        return this.number1 + this.number2;
    }

    number1ChangeHandler(event){
        this.number1= event.target.value;
    }
    number2ChangeHandler(event){
        this.number2=event.target.value;
    
    


}
}