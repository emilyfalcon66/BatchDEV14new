import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';


export default class GetPicklistValuesByRecordTypeOpportunity extends LightningElement {
    oppName;
    selectedStage;
    selectedType;
    stageOptions = [];
    typeOptions = []; 

    changeHandler(event) {
        const elem = event.target.label;
        if(elem == "Select Stage") {
            this.selectedStage = event.target.value;
        } else {
            this.selectedType = event.target.value;
        }
    }

    @wire(getObjectInfo, {objectApiName: OPPORTUNITY_OBJECT})
    opportunityInfo;

    @wire(getPicklistValuesByRecordType, {
        objectApiName: OPPORTUNITY_OBJECT,
        recordTypeId: '$opportunityInfo.data.defaultRecordTypeId'
    }) picklistHandler({data, error}) {
        if(data) {
            console.log(data);
            this.stageOptions = data.picklistFieldValues.StageName.values;
            this.typeOptions = data.picklistFieldValues.Type.values
        }
        if(error) {
            console.error(error);
        }
    }

}