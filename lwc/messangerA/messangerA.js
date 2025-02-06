import { LightningElement, wire, track } from 'lwc';
import { subscribe, publish, MessageContext } from 'lightning/messageService';
import MESSAGE_TRANSFER from '@salesforce/messageChannel/messageChannelName__c';

export default class MessangerA extends LightningElement {

    @wire(MessageContext)
    messageContext;
    @track name;
    @track text;

    sendMessage(event){
        var inp=this.template.querySelector("lightning-input");
        this.name=inp.value;
        publish(this.messageContext, MESSAGE_TRANSFER, {messageToSendA2B : this.name});
    }   

    connectedCallback(){
        subscribe(this.messageContext, MESSAGE_TRANSFER, (message) => { 
            this.text = message.messageToSendB2A;
    });
    
    }
}