@IsTest
public class ContactsTriggerTest {
    
    @IsTest
    static void testDynamicUpdateField() {
        Account Test1 = new Account();
        Test1.Name = 'Testing';        
        insert Test1; 
        
        Opportunity thisopp = new Opportunity();
        thisopp.Name = 'Testing Opportunity';
        thisopp.StageName = 'Qualification';        
        thisopp.CloseDate = Date.Today();
        thisopp.Amount = 100000;
        insert thisopp;
        
        Contact thisContact = new Contact();
        thisContact.LastName = 'Contact1';           
        thisContact.RecordId__c = Test1.Id;
        insert thisContact;         
        
		List<Contact> conList = [SELECT Id, Object_Name__c, Picklist_Field__c FROM Contact WHERE Id = :thisContact.Id];
        Assert.areEqual('Account', conList[0].Object_Name__c);
        conList[0].RecordId__c = thisopp.Id;
        update conList;

        List<Contact> conList2 = [SELECT Object_Name__c FROM Contact WHERE Id = :thisContact.Id];
        Assert.areEqual('Opportunity', conList2[0].Object_Name__c);


    }


}