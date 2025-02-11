import { LightningElement, track, api, wire } from 'lwc';
import fetchContact from '@salesforce/apex/RelatedContact.fetchContact';
import { refreshApex } from '@salesforce/apex';

columns = [ { label: 'FirstName', fieldName: 'FirstName', type: 'text' }, 
                 { label: 'LastName', fieldName: 'LastName', type: 'text' },
                 { label: 'Email', fieldName: 'Email', type: 'mail' },
                 { label: 'Phone', fieldName: 'Phone', type: 'phone' }];
export default class AccountManagerWizard extends LightningElement {

    @api recordId;
    searchKey ='';
    @track contacts = [];
    @track filteredContacts = [];
    wiredResult;

    @wire (fetchContact , {accId : '$recordId'})
    wiredContacts(Result){
        this.wiredResult = Result;
        if(Result.data){
            this.contacts = Result.data;
            this.filteredContacts = this.contacts;
            
        }else if (Result.error){
            console.error('Error ' , Result.error);
            this.contacts = [];
            this.filteredContacts = [];
        }
    }
    handleKeyChange(event){
        this.searchKey = event.target.value.toLowerCase();        
        if (!this.contacts ||  this.contacts.length === 0) {
            this.filteredContacts = [];
            return;
        }
        if (this.searchKey) {
            this.filteredContacts = this.contacts.filter(contact => {
                const searchTerm = this.searchKey.toLowerCase();
                return (
                    (contact.FirstName && contact.FirstName.toLowerCase().includes(searchTerm)) ||
                    (contact.LastName && contact.LastName.toLowerCase().includes(searchTerm)) ||
                    (contact.Email && contact.Email.toLowerCase().includes(searchTerm)) ||
                    (contact.Phone && contact.Phone.toLowerCase().includes(searchTerm))
                );
            });  
        }
         else {
            this.filteredContacts = [...this.contacts]; 
        }
}
    isCreate = false;
    isRelated = false;
    contactCreate(){
        if(this.isCreate == true){
            this.isCreate =false;
        }else{
            this.isCreate =true;
        }
    }
    get isNoContactToshow(){
        return this.filteredContacts.length === 0 && this.searchKey !== '';
    }
    handleChildData(event) {
        this.isCreate = event.detail.created; 
        if(event.detail.recordCreated === 'Yes'){
            refreshApex(this.wiredResult);
        }
    }
    childData(event){
        this.isCreate = event.windows;
    }
}
