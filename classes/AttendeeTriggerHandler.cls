/**
 * Description : This class is created to perform some action on Attendee's Field.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 11/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */


public class AttendeeTriggerHandler  {
    
/**
 * Description : This method is created to count number of Attendee and update Field on Contact.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 11/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */

    
    public static void numberOfAttendeesEnrolledForSession(List<Attendee__c> newListOfSession){
        
        Map<Id, Integer> mapOfContactAndAttendee = new Map<Id, Integer>();
            
           for(Attendee__c thisAttendee : newListOfSession) {
                if(!mapOfContactAndAttendee.containsKey(thisAttendee.LookupContactToAttendee__c)) {
                    mapOfContactAndAttendee.put(thisAttendee.LookupContactToAttendee__c, 1);
                }
                else {
                    mapOfContactAndAttendee.put(thisAttendee.LookupContactToAttendee__c, 
                                                    mapOfContactAndAttendee.get(thisAttendee.LookupContactToAttendee__c) + 1);
                }
            }
            
            List<Contact> thisContact = [SELECT Id, AttendeeEnrolledForSession__c FROM Contact WHERE Id 
                                            IN :mapOfContactAndAttendee.keySet()];
            for(Contact updateContact : thisContact) {
                updateContact.AttendeeEnrolledForSession__c = updateContact.AttendeeEnrolledForSession__c +  
                                                                    mapOfContactAndAttendee.get(updateContact.Id);
            }
            update thisContact;
        }
}
