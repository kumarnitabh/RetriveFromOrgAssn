public with sharing class RelatedContact {
    @AuraEnabled(cacheable=true)
    public static List<Contact> fetchContact(Id accId) {

        List<Contact> clist =  [SELECT AccountId, FirstName, LastName, Email, Phone FROM Contact WHERE AccountId =: accId];
		return clist;
    }
}