import { LightningElement, api, track } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import OBJECT_NAME from '@salesforce/schema/Account';
import FIELD_NAME from '@salesforce/schema/Account.Name';
import FIELD_NUMBER from '@salesforce/schema/Account.Website';
import FIELD_PHONE from '@salesforce/schema/Account.Phone';
import CONTACT_FIRST_NAME from '@salesforce/schema/Contact.FirstName';
import CONTACT_LAST_NAME from '@salesforce/schema/Contact.LastName';
import CONTACT_PHONE from '@salesforce/schema/Contact.Phone';
import CONTACT_EMAIL from '@salesforce/schema/Contact.Email';
import CONTACT_ACCID from '@salesforce/schema/Contact.AccountId';


export default class AccountFieldWithContactCreate extends LightningElement {

    fieldName = FIELD_NAME;
    fieldNumber = FIELD_NUMBER;
    fieldPhone = FIELD_PHONE;
    objectApiName = OBJECT_NAME;
    @api recordId;
    @track accountId;
    isInsert = false;
    firstName= CONTACT_FIRST_NAME;
    lastName = CONTACT_LAST_NAME;
    fieldPhone = CONTACT_PHONE;
    fieldEmail= CONTACT_EMAIL;
    
    
    fields =[CONTACT_FIRST_NAME, CONTACT_LAST_NAME,CONTACT_PHONE, CONTACT_EMAIL, CONTACT_ACCID];

    handlerClick(){
        if(this.isInsert == true){
            this.isInsert = false;
        }else{
            this.isInsert = true;
        }


    }
    clickhandler(){
        const events = new ShowToastEvent({
            title : 'Successfully',
            message : 'Successfully edited',
            variant : 'success'
        })
        this.dispatchEvent(events);
        this.isInsert = false;
    }
    clickcancelhandler(){
        this.isInsert = false;
    }
}