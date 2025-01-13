/**
 * Description : This class is created to validate Field on Contact.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 09/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */


public class ContactBeforeTriggerHandler {
    
    public static String str ='Email must contain Domain of associate Account.';
    
/**
 * Description : This method is created to validate Email field on Contact.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 09/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */

   public static void validateEmailOnContact(List<Contact> newListOfContact, map<Id, Contact> oldMap){
        
        Map<Id, String> mapEmailOfContact = new Map<Id, String>();
        for(Account thisAccount : [Select Id, Domain__c from Account]){
            mapEmailOfContact.put(thisAccount.Id, thisAccount.Domain__c);
        }
        for(Contact thisContact : newListOfContact){
            if(thisContact.AccountId != null && thisContact.Email != null){ 
                if(thisContact.Email.substringAfter('@').toLowerCase() != mapEmailOfContact.get(thisContact.AccountId)){ 
                thisContact.addError('Email must contain Domain of associate Account.');
                }
            
            
        } 
    }
    
    }
