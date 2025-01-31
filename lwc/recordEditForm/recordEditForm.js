import { LightningElement, api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import OBJECT_NAME from '@salesforce/schema/Opportunity'
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import CLOSED_DATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';
import REVENUE_FIELD from '@salesforce/schema/Opportunity.ExpectedRevenue';


export default class RecordEditForm extends LightningElement {
    namefield = NAME_FIELD;
    accountnamefield = ACCOUNT_FIELD;
    amountfield = AMOUNT_FIELD;
    stagefield = STAGE_FIELD;
    closeddatefield = CLOSED_DATE_FIELD;
    revenuefield = REVENUE_FIELD;
    objectApiName =  OBJECT_NAME;
    opportunityId = "";

   // @api recordId;
   // @api objectApiName;

    handlesuccess(event){
        this.opportunityId = event.detail.id;
        const events = new ShowToastEvent({
            title : 'Successfull',
            message : 'Successfully edited',
            variant : 'success'
        })
        this.dispatchEvent(events);
    }

}