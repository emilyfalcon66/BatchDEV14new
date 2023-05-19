import { LightningElement, wire } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent} from 'lightning/platformShowToastEvent';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import PRODUCT_OBJECT from '@salesforce/schema/Ecommerce_Product__c';

export default class CreateRecordProduct extends LightningElement {
    formdata = {};

    @wire(getObjectInfo, {objectApiName: PRODUCT_OBJECT})
    productInfo;

    changeHandler(event) {
        const name = event.target.name;
        const value = event.target.value;
        this.formdata[name] = value;
        console.log(JSON.stringify(this.formdata));
    }
    cancelHandler() {
        this.template.querySelector('form.productform').reset();
        this.template.querySelector('lightning-combobox.brand').value = undefined;
        this.template.querySelector('lightning-combobox.category').value = undefined;     
        this.formdata = {};
    }

    saveHandler() {
        //prepare recordInput
        const recordInput = {
            apiName: PRODUCT_OBJECT.objectApiName,
            fields: this.formdata
        };
        //create record
        createRecord(recordInput)
        .then(result => {
            const toast = new ShowToastEvent({
                title: "Success",
                message: "product record has been created successfully!",
                variant: "success"
            });
            this.dispatchEvent(toast);
        })
        .catch(error => {
            console.error(error);
            const toast = new ShowToastEvent({
                title: error.detail.message,
                message: error.detail.detail,
                variant: "error"
            });
            this.dispatchEvent(toast);
        })
    }

    get brandOptions() {
        return [
            {label: 'Samsung', value: "Samsung"},
            {label: 'Apple', value: "Apple"},
            {label: 'Blackberry', value: "Blackberry"},
            {label: 'Nokia', value: "Nokia"},
        ];
    }

    get categoryOptions() {
        return [
            {label: "Smartphones", value: "Smartphones"},
            {label: "Tablets", value: "Tablets"},
            {label: "Refrigeratos", value: "Refrigeratos"},
            {label: "Air Conditioners", value: "Air Conditioners"},
            {label: "Smart Watches", value: "Smart Watches"},
            {label: "Head Phones", value: "Head Phones"}
        ];
    }
}