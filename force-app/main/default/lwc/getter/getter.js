import { LightningElement } from 'lwc';

export default class Getter extends LightningElement {
    users = ["John", "Mike", "Betty"];
    num1 = 10;
    num2 = 20;

    get sumOfNums(){
        return this.num1 + this.num2;
    }
    get firstUser(){
        return this.users[0];
    }
}