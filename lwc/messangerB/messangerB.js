import { LightningElement, wire, track } from 'lwc';
import { subscribe, MessageContext, publish } from 'lightning/messageService';
import MESSAGE_TRANSFER from '@salesforce/messageChannel/messageChannelName__c';

export default class MessangerB extends LightningElement {

    @wire(MessageContext)
    messageContext;
    @track texts;

    @track name;
    sendMessage(event){
        var inp=this.template.querySelector("lightning-input");
        this.name=inp.value;
        publish(this.messageContext, MESSAGE_TRANSFER, {messageToSendB2A : this.name});
    }    
    
    connectedCallback(){
        subscribe(this.messageContext, MESSAGE_TRANSFER, (message) => { 
            this.texts = message.messageToSendA2B;
    });
    
    }
}