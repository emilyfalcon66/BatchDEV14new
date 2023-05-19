import { LightningElement, wire } from 'lwc';
import PRODUCT_OBJECT from '@salesforce/schema/Ecommerce_Product__c';
import getProducts from '@salesforce/apex/productControl.getProducts';


const COLUMNS =[
    {label:'Product Name',fieldName:'Name',type:'text'},
    {label:'Title',fieldName:'Title__c',type:'text'},
    {label:'Brand',fieldName:'Brand__c',type:'text'},
    {label:'Category',fieldName:'Category__c',type:'text'},
    {label:'Price',fieldName:'Price__c',type:'currency'}
];



export default class ProductControl extends LightningElement {
    products;
    error;
    columns=COLUMNS;
    amount;

    changeHandler(number){
        this.amount = number.target.value;
        getProducts({
            amount: this.amount

        }) 
        .then(result => {
            this.products=result;
            this.error = undefined;
        })
        .catch(error=> {
            this.error=error;
            this.products = undefined;
        })
}

    
}