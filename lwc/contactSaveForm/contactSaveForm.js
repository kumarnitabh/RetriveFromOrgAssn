import { LightningElement, track, api } from 'lwc';
import addContact from '@salesforce/apex/ContactController.createContact';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ContactSaveForm extends LightningElement {
    @api parentId;
    @api create;

    @track myContact = { 'sobjectType': 'Contact' };
    firstNameChange(event){
        this.myContact.FirstName = event.target.value;
    }
    lastNameChange(event){
        this.myContact.LastName = event.target.value;
        this.myContact.AccountId = this.parentId;
    }
    emailChange(event){
        this.myContact.Email = event.target.value;
    }
    handleSelectedValue(event){
        this.myContact.LeadSource = event.detail.value;

    }
    handleCancelClick(){
        const event = new CustomEvent('canceldata', {

            windows : false,
    });
    this.dispatchEvent(event);
}
    handleSaveClick(){
        addContact({contactRecord : this.myContact})
        .then(result => {
            const event1 = new ShowToastEvent({
                title: 'Contact created',
                message: 'Contact created successfully',
                variant : 'success',
            });
            this.dispatchEvent(event1);
            const event2 = new CustomEvent('senddata', {
                
                detail: {

                    recordCreated: 'Yes',
                    created : false
                }
            });
            this.dispatchEvent(event2);        
        })
        .catch(error => {
            const event3 = new ShowToastEvent({
                title: 'Error.....',
                message: 'Email & Last Name must be compulsory and email must be in proper format '+error.body.message,
                variant : 'error',
            });
            this.dispatchEvent(event3);          
        });
}       
}
