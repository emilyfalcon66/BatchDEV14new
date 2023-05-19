import { LightningElement } from 'lwc';
import {ShowToastEvent } from 'lightning/platformShowToastEvent';
import { deleteRecord } from 'lightning/uiRecordApi';
export default class DeleteRecordFunction extends LightningElement {
    recordId;
    changeHandler(event){
        this.recordId= event.target.value;
    }
    deleteHandler(){
        if(this.recordId.length ==15 || this.recordId.length == 18) {
            deleteRecord(this.recordId)
            .then(result=> {
                //show success toast
                this.prepareToast("success " ,"Record has been deleted successfully", "success");
            })
            .catch(error => {
                console.error(error);
                this.prepareToast(error.StatusText, error.body.message, "error");
            })
           
            //delete record
        }else{
            this.prepareToast("warning", "pls enter 15 or 18 digit record id only", "warning");
            //show warning toast
            
        }
    }
    prepareToast(title, message, variant) {
                const toast = new ShowToastEvent({title,message, variant});
                this.dispatchEvent(toast);
    }
}





