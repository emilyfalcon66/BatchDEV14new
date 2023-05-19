import getRecentLeads from '@salesforce/apex/LeadCtrl.getRecentLeads';
import { LightningElement } from 'lwc';

export default class ImperativeApexLead extends LightningElement {
    leads;
    error;
    
    fetchLeads() {
        getRecentLeads()
        .then(result => {
            console.log(result);
            this.leads = result;
        })
        .catch(error => {
            console.error(error);
            this.error = error;
        })

    }
}