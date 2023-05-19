import { LightningElement } from 'lwc';
import AIRLINES_OBJECT from '@salesforce/schema/Airlines__c'
import AIRLINES_ID_FIELD from '@salesforce/schema/Airlines__c.Name';
import NAME_FIELD from '@salesforce/schema/Airlines__c.Name__c';
import LOGO_FIELD from '@salesforce/schema/Airlines__c.Logo__c';
import LOGO_URL_FIELD from '@salesforce/schema/Airlines__c.Logo_URL__c';
import SLOGAN_FIELD from '@salesforce/schema/Airlines__c.Slogan__c';
import WEBSITE_FIELD from '@salesforce/schema/Airlines__ChangeEvent.Website__c';


import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class RecordFormProduct extends LightningElement {
    objectName = AIRLINES_OBJECT;
    recordId = "a09Dn000002ZzdiIAC";

    fields=[AIRLINES_ID_FIELD,NAME_FIELD,LOGO_FIELD,LOGO_URL_FIELD,SLOGAN_FIELD,SLOGAN_FIELD]

    successHandler(){
        const evt = new ShowToastEvent({
            title: "Success",
            message: "Airlines details have been saved successfully!",
            variant: "success"
        });
        this.dispatchEvent(evt);

    }
}