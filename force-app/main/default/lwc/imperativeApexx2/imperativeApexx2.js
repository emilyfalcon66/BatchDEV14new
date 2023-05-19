import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import getOppsByStage from '@salesforce/apex/OpportunityCtrl.getOppsByStage';

const COLUMNS = [
    {label: "Opp Name", fieldName: "Name", type: "text"},
    {label: "Type", fieldName: "Type", type: "text"},
    {label: "Amount", fieldName: "Amount", type: "currency"},
    {label: "Close Date", fieldName: "CloseDate", type: "date"}
];

export default class ImperativeApexx2 extends LightningElement {
    stageOptions = [];
    selectedStage;
    opps;
    error;
    columns = COLUMNS;

    changeHandler(event) {
        this.selectedStage = event.target.value;
        getOppsByStage({Stage: this.selectedStage})
            .then(result => {
                this.opps = result;
                console.log("Opps By Stage", result);
            })
            .catch(error => {
                this.error = error;
            })
    }

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    oppInfo;

    @wire(getPicklistValues, {
        fieldApiName: STAGE_FIELD,
        recordTypeId: '$oppInfo.data.defaultRecordTypeId'
    }) picklistHandler({data, error}) {
        if(data) {
            this.stageOptions = data.values;
        }
    }
}