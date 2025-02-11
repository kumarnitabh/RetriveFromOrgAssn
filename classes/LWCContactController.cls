public with sharing class LWCContactController {
    @AuraEnabled
    public static void createContact(Contact contactRecord) {
        insert contactRecord;
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> fetchContactDetails(Id accId) {
        List<Contact> clist =  [SELECT AccountId, FirstName, LastName, Email, Phone FROM Contact WHERE AccountId =: accId];
		return clist;
    }
}