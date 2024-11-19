<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EA_after_leave_rejected</fullName>
        <description>EA after leave rejected</description>
        <protected>false</protected>
        <recipients>
            <field>Email_Sent_to_student_Father__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SchedulerUnauthenticatedUserAppointmentTypeEmailTemplateForAmazonChime</template>
    </alerts>
    <alerts>
        <fullName>EA_for_leave_status</fullName>
        <description>EA for leave status</description>
        <protected>false</protected>
        <recipients>
            <field>Email_Sent_to_student_Father__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Leave_inprogress_Email</template>
    </alerts>
    <alerts>
        <fullName>EA_for_leave_statuss</fullName>
        <description>EA for leave status</description>
        <protected>false</protected>
        <recipients>
            <recipient>nitabh.kumar@fexle.com.training.prod</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Leave_inprogress_Email</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_For_less_Attendance</fullName>
        <description>Email Alert For less Attendance</description>
        <protected>false</protected>
        <recipients>
            <field>Email_Sent_to_student_Father__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SupportCaseResponse</template>
    </alerts>
    <alerts>
        <fullName>Email_for_Leave_status</fullName>
        <description>Email for Leave status</description>
        <protected>false</protected>
        <recipients>
            <field>Email_Sent_to_student_Father__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Leave_Reject_Mail</template>
    </alerts>
    <fieldUpdates>
        <fullName>FU_after_leave_approval</fullName>
        <field>Trail_Field__c</field>
        <name>FU after leave approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>WF For Attendance less than 75</fullName>
        <actions>
            <name>Email_Alert_For_less_Attendance</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>student__c.Attendance__c</field>
            <operation>lessThan</operation>
            <value>75</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
