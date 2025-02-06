import { LightningElement, track} from 'lwc';
import getAccounts from '@salesforce/apex/AccountManagerController.getAccounts';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Rating', fieldName: 'Rating', type: 'text' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Type', fieldName: 'Type', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
];

export default class AccountManagers extends LightningElement {

	column = columns;
	@track accounts;
	
	connectedCallback(){
		this.fetchAccount();
	}
    
		fetchAccount(){
			getAccounts()
		.then(result => {
			this.accounts = result;
			this.error = undefined;
		})
		.catch(error => {
			this.error = error;
			this.accounts = undefined;
		})

		}
		

}