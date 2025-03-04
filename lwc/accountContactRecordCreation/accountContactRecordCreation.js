import { LightningElement, wire, track } from 'lwc';
import recordOfAccount from '@salesforce/apex/AccountRecordFetch.recordOfAccount';
import accountCreate from '@salesforce/apex/AccountRecordFetch.accountCreate';
import contactCreate from '@salesforce/apex/AccountRecordFetch.contactCreate';
import { refreshApex } from '@salesforce/apex';
import getobjectApiName from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import PHONE__FIELD from '@salesforce/schema/Contact.Phone';
import FIRST_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';

export default class AccountContactRecordCreation extends LightningElement {

    @track AccountRecord=[];
    error;
    objectApiName = getobjectApiName;
    @track myAccount = { 'sobjectType': 'Account' };
    NameChange(event){
        this.myAccount.Name = event.target.value;
        
    }
    PhoneChange(event){
        this.myAccount.Phone = event.target.value;
    }
    IndustryChange(event){
        this.myAccount.Industry = event.target.value;
    }
    isContactCreate = false;

    accountRecordId;

    handleAccountSaveClick(){
        accountCreate({accRecord : this.myAccount})
        .then(result => {
            this.accountRecordId = result;
            this.isCreate=false;
            this.isContactCreate=true;
            refreshApex(this.wiredListResultData);
          })
        
        
    }
    handleAccountCancelClick(){
        this.isCreate=false;
    }
    

    @track myContact = { 'sobjectType': 'Contact' };
    firstNameChange(event){
        this.myContact.FirstName = event.target.value;
        
    }
    lastNameChange(event){
        this.myContact.LastName = event.target.value;
        this.myContact.AccountId = this.accountRecordId.Id;
        
    }
    emailChange(event){
        this.myContact.Email = event.target.value;
    }
    handleContactSaveClick(){
        contactCreate({conRecord : this.myContact})
        this.isContactCreate=false;
        this.isCreate=false;
        
        
    }
    handleContactCancelClick(){
        this.isCreate = false;
        this.isContactCreate=false;
    }
    
    namefield = NAME_FIELD ;
    Industryfield = INDUSTRY_FIELD ;
    Phonefield = PHONE_FIELD ;
    firstnamefield = FIRST_NAME_FIELD;
    lastNameField = LAST_NAME_FIELD
    contactPhonefield = PHONE__FIELD

    columns = [ { label: 'Name', fieldName: 'Name', type: 'text' }, 
        { label: 'Industry', fieldName: 'Industry', type: 'text'},
        { label: 'Phone', fieldName: 'Phone', type: 'phone'}];

        @wire(recordOfAccount)
        wiredAccount(Result){
            this.wiredListResultData = Result;
            if(Result.data){
                this.AccountRecord=Result.data;
            }
            else if(Result.error){
                this.error=Result.error;
            }
        }
        isCreate = false;
        accountCreate(){
            if(this.isCreate == true){
                this.isCreate =false;
            }else{
                this.isCreate =true;
            }
            
        }
        
}