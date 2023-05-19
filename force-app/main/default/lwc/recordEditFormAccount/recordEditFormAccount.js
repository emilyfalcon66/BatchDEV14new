import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import ACC_NUM_FIELD from '@salesforce/schema/Account.AccountNumber';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ValidationCert from '@salesforce/schema/SamlSsoConfig.ValidationCert';

export default class RecordEditFormAccount extends LightningElement {
    objectName = ACCOUNT_OBJECT;
    recordId = "001Dn00000B9PUmIAN";
    fields = {
        name: NAME_FIELD,
        type: TYPE_FIELD,
        industry: INDUSTRY_FIELD,
        revenue: REVENUE_FIELD,
        accNum: ACC_NUM_FIELD,
        phone: PHONE_FIELD
    };
    successHandler() {
        const evt = new ShowToastEvent({
            title: "Success",
            message: "Account information has been saved successfully!",
            variant: "success"
        });
        this.dispatchEvent(evt);
    }
    /*errorHandler(event) {
        console.log(event.detail.message);
            
        }
        onerror={errorHandler}*/

}