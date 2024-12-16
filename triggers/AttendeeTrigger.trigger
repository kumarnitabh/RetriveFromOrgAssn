/**
 * Description : This trigger is created to handle the logic for the Attendee trigger.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 11/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */


trigger AttendeeTrigger on Attendee__c (after insert) {
    
    if(trigger.isAfter){
        if(trigger.isInsert){
            
            AttendeeTriggerHandler.numberOfAttendeesEnrolledForSession(trigger.new);
        }
    }

}