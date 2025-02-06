import { LightningElement, track, api } from 'lwc';
import addContact from '@salesforce/apex/CreateContact.addContact';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ContactSaveForm extends LightningElement {
    @api parentId;
    @track getContactRecord={
        FirstName : '',
        LastName : '',
        Email : '',
        AccountId : '',
    };
    firstNameChange(event){
        this.getContactRecord.FirstName = event.target.value;
    }
    lastNameChange(event){
        this.getContactRecord.LastName = event.target.value;
        this.getContactRecord.AccountId = this.parentId;
    }
    emailChange(event){
        this.getContactRecord.Email = event.target.value;
    }
    handleSaveClick(){
        addContact({insertContact:this.getContactRecord})
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
                message: 'Email & Last Name must be compulsory and email must be in proper format ',
                variant : 'error',
            });
            this.dispatchEvent(event3);          
        });
}
}