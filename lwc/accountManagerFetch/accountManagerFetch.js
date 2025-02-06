import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountManagerController.getAccounts';

const columns = [
{ label: 'Name', fieldName: 'Name' },
{ label: 'Rating', fieldName: 'Rating', type: 'text' },
{ label: 'Phone', fieldName: 'Phone', type: 'phone' },
{ label: 'Type', fieldName: 'Type', type: 'text' },
{ label: 'Industry', fieldName: 'Industry', type: 'text' },
];


export default class AccountManagerFetch extends LightningElement {

column = columns;
    @track accounts;
    
    @wire (getAccounts)
    wiredAccounts({data, error}){
    if(data) {
        this.accounts =data;
        this.error = undefined;
    }else {
        this.accounts =undefined;
        this.error = error;
    }
}



}