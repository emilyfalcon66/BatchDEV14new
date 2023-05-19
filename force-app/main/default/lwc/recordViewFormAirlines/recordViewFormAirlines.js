import { LightningElement } from 'lwc';
import AIRLINES_OBJECT from '@salesforce/schema/Airlines__c';
import NAME_FIELD from '@salesforce/schema/Airlines__c.Name';
import COUNTRY_FIELD from '@salesforce/schema/Airlines__c.Country__c';
import LOGO_FIELD from '@salesforce/schema/Airlines__c.Logo__c';
import LOGO_URL_FIELD from '@salesforce/schema/Airlines__c.Logo_URL__c';
import SLOGAN_FIELD from '@salesforce/schema/Airlines__c.Slogan__c';
import WEBSITE_FIELD from '@salesforce/schema/Airlines__c.Website__c';


export default class RecordViewFormAccount extends LightningElement {
    objectName = AIRLINES_OBJECT;
    recordId = "a09Dn000002ZzdiIAC";
    fields = {
        name: NAME_FIELD,
        country: COUNTRY_FIELD,
        logo: LOGO_FIELD,
        logoURL: LOGO_URL_FIELD,
        slogan: SLOGAN_FIELD,
        website: WEBSITE_FIELD
    }
}