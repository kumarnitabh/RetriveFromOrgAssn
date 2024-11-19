<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EA_for_Discount_status</fullName>
        <description>EA for Discount status</description>
        <protected>false</protected>
        <recipients>
            <recipient>nitabh.kumar@fexle.com.training.prod</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Discount_request</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approved_Field_Change_To_Check</fullName>
        <field>Discount_Approved__c</field>
        <literalValue>1</literalValue>
        <name>Approved_Field_Change_To_Check</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
</Workflow>
