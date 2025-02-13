import { LightningElement,api, wire, track } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';

export default class GenericComponentPicklist extends LightningElement {

    @api objectName;
    @api fieldName;

    @track picklistOption= [{ label: '--None--', value: '' }];
    @track value = '';
    
    @wire(getObjectInfo, { objectApiName: '$objectName' })
    objectInfo;

    @wire(getPicklistValues, {
        recordTypeId: '$objectInfo.data.defaultRecordTypeId',
        fieldApiName: '$fieldName',
    })
    picklistValues({ data, error }) {
        if (data) {
            this.picklistOption = [
                { label: '--None--', value: '' },
                ...data.values.map(item => ({ label: item.label, value: item.value }))
            ];
        } else if (error) {
        }
    }

    handleChange(event) {
        this.value = event.detail.value;
        this.dispatchEvent(
            new CustomEvent("selectedvalue", {
                detail: {
                    value: event.detail.value
                }
            })
        );
    }



}
