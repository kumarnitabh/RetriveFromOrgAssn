import { LightningElement , api, track} from 'lwc';
import FETCH_OBJECT from '@salesforce/schema/Opportunity'
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import CLOSED_DATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';
import REVENUE_FIELD from '@salesforce/schema/Opportunity.ExpectedRevenue';

export default class RecordForm extends LightningElement {
    objectApiName = FETCH_OBJECT;
    @track fields =[NAME_FIELD, ACCOUNT_FIELD, AMOUNT_FIELD, STAGE_FIELD, CLOSED_DATE_FIELD, REVENUE_FIELD];
    recordId = "006NS00000O25UVYAZ";
    isCreate = false;
    isEdit = false;
    isRead = false;

    handleClick(){
        if(this.isCreate== true){
            this.isCreate= false;
        }else{
            this.isCreate= true;
        }
    }
    editClick(){
        if(this.isEdit== true){
            this.isEdit= false;
        }else{
            this.isEdit= true;
        }
    }

    readClick(){
        if(this.isRead== true){
            this.isRead= false;
        }else{
            this.isRead= true;
        }
    }




    
}