import Website from '@salesforce/schema/Account.Website';
import { LightningElement, track } from 'lwc';

const columns  = [
    { label: 'FirstName', fieldName: 'firstName', type: 'text', editable: true },
    { label: 'LastName', fieldName: 'lastName', type: 'text', editable: true},
    { label: 'Website', fieldName: 'Website', type: 'text', editable: true },
    { label: 'Email', fieldName: 'Email', type: 'email', editable: true }
];

export default class AccountManager extends LightningElement {

    @track column = columns;

    @track data = [ 
       
        { id: '1', firstName: 'Willy', lastName: 'James', Website: 'willy21@gmail.com', Email: 'willy21@gmail.com'}, 
        { id: '2', firstName: 'Jane', lastName: 'Smith', Website: 'willy21@gmail.com', Email: 'willy21@gmail.com' }, 
        { id: '3', firstName: 'Michael', lastName: 'Johnson', Website: 'willy21@gmail.com', Email: 'willy21@gmail.com' },
        { id: '4', firstName: 'Emily', lastName: 'Davis', Website: 'willy21@gmail.com', Email: 'willy21@gmail.com' }, 
        { id: '5', firstName: 'David', lastName: 'Brown', Website: 'willy21@gmail.com', Email: 'willy21@gmail.com' } 
    ];

}