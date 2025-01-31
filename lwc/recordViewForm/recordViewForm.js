import { LightningElement, api} from 'lwc';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import CLOSED_DATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';
import REVENUE_FIELD from '@salesforce/schema/Opportunity.ExpectedRevenue';


export default class RecordViewForm extends LightningElement {
    namefield = NAME_FIELD;
    accountnamefield = ACCOUNT_FIELD;
    amountfield = AMOUNT_FIELD;
    stagefield = STAGE_FIELD;
    closeddatefield = CLOSED_DATE_FIELD;
    revenuefield = REVENUE_FIELD;

    @api recordId;
    @api objectApiName;



}