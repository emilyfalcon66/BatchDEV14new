import { LightningElement, wire } from 'lwc';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { getFieldValue, getRecord, updateRecord } from 'lightning/uiRecordApi';
const FIELDS =[NAME_FIELD, TYPE_FIELD, STAGENAME_FIELD, AMOUNT_FIELD, CLOSEDATE_FIELD];
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class UpdateRecorddOpportunity extends LightningElement {
   oppRecId ='006Dn0000051r45IAA';
   typeOptions=[];
   stageOptions=[];
   formdata ={};


   @wire(getObjectInfo, {objectApiName:OPPORTUNITY_OBJECT}) 
   opportunityInfo;
   @wire(getPicklistValuesByRecordType, {
      objectApiName:OPPORTUNITY_OBJECT,
      recordTypeId: '$opportunityInfo.data.defaultRecordTypeId'
   }) 
      picklistHandler({data,error}){
        if(data){
            console.log(data);
            this.typeOptions= data.picklistFieldValues.Type.values;
            this.stageOptions=data.picklistFieldValues.StageName.values;
        }
      }
      changeHandler(event){
        this.formdata[event.target.name] = event.target.value;
      }
      updateHandler(event){
        this.formdata['Id'] = this.oppRecId;
        const recordInput ={fields: this.formdata};
        updateRecord(recordInput)
        .then(result => {
            console.log('result', result);
            const toast= new ShowToastEvent({
                title:"Success",
                message:"Opportunity Record has been updated successfully!",
                variant:"success"
             });
              this.dispatchEvent(toast);
        })
          .catch(error=> {
            console.log('error', error);
            const toast= new ShowToastEvent({
                title: error.detail.message,
                message: error.detail.detail,
                variant: 'error'
            });
            this.dispatchEvent(toast);
          })
      }
    @wire(getRecord, { 
        fields: FIELDS,
        recordId : '$oppRecId'    
    })opportunity;
   
    get name(){
        return getFieldValue(this.opportunity.data, NAME_FIELD);

    }
    get type(){
        return getFieldValue(this.opportunity.data, TYPE_FIELD);
        
    }
    get stage(){
        return getFieldValue(this.opportunity.data, STAGENAME_FIELD);
        
    }
    get amount(){
        return getFieldValue(this.opportunity.data, AMOUNT_FIELD);
        
    }
    get closeDate(){
        return getFieldValue(this.opportunity.data, CLOSEDATE_FIELD);
        
    }

}