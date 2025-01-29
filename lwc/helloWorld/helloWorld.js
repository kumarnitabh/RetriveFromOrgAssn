import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
        message ='';
    changeHandler(event){
        this.message = event.target.value;
    } 
}