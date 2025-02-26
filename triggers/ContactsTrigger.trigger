/**
 * Description : This trigger is created to handle the logic for the Contact trigger.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 09/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */

trigger ContactsTrigger on Contact (before insert, after insert) {
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            
            ContactBeforeTriggerHandler.validateEmailOnContact(Trigger.new, Trigger.oldMap);
            ContactBeforeTriggerHandler.dynamicUpdateField(Trigger.new, trigger.oldMap);
            
            
        }
    }
    
    if(trigger.isAfter){
        if(trigger.isInsert){
            ContactsTriggerHandler.validateAddresses(trigger.new); 
            
        }
    }
       
}