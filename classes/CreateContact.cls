public with sharing class CreateContact {
    @AuraEnabled
    public static void addContact(Contact contactToInsert) {
        insert contactToInsert;
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [
            SELECT Id, Name,Phone, Email
            FROM Contact
            WHERE Name LIKE :key
           
        ];
    }
}
