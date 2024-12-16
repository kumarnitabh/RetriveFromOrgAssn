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
      
    public static void updateSessionCounts(List<Attendee__c> attendees) {
        Set<Id> contactIds = new Set<Id>();
        
        for (Attendee__c attendee : attendees) {
            if (attendee.LookupContactToAttendee__c != null) {
                contactIds.add(attendee.LookupContactToAttendee__c);
            }
        }
        
        if (!contactIds.isEmpty()) {
            List<AggregateResult> results = [
                SELECT LookupContactToAttendee__c, COUNT(Id)  attendeeCount
                FROM Attendee__c 
                WHERE LookupContactToAttendee__c IN :contactIds
                GROUP BY LookupContactToAttendee__c];
            
            Map<Id, Integer> contactSessionCounts = new Map<Id, Integer>();
            for (AggregateResult result : results) {
                contactSessionCounts.put(
                    (Id) result.get('LookupContactToAttendee__c'), 
                    (Integer) result.get('attendeeCount')
                );
            }
            
            List<Contact> contactsToUpdate = new List<Contact>();
            for (Id contactId : contactSessionCounts.keySet()) {
                contactsToUpdate.add(new Contact(
                    Id = contactId,
                    AttendeeEnrolledForSession__c = contactSessionCounts.get(contactId)
                ));
            }
            
            if (!contactsToUpdate.isEmpty()) {
                update contactsToUpdate;
            }
        }
    }
}
