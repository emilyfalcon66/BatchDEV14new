import { LightningElement } from 'lwc';
import CASE_OBJECT from '@salesforce/schema/Case';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import ACC_NAME_FIELD from '@salesforce/schema/Case.AccountId';
import CONTACT_NAME_FIELD from '@salesforce/schema/Case.ContactId';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {shortToatsEvent} from 'lightning/platformShowToastEvent'; 


export default class RecordEditFormCase extends LightningElement {
    objectName = CASE_OBJECT;
    recordId = "500Dn000003ziF0IAI";
    fields = {
        subject: SUBJECT_FIELD,
        priority:PRIORITY_FIELD,
        status: STATUS_FIELD,
        description: DESCRIPTION_FIELD,
        origin: ORIGIN_FIELD,
        accountName: ACC_NAME_FIELD,
        contactName: CONTACT_NAME_FIELD
    };

    successHandler() {
        const evt = new ShowToastEvent({
            title:"Success",
            message:"Case information has been saved successfully!",
            variant:"success"
        });
        this.dispatchEvent(evt);
    }

}