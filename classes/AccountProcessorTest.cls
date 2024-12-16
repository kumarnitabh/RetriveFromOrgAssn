@isTest
public class AccountProcessorTest {
    @isTest
    static void testAccountTriggerHAndler(){
        
        Account acc = new Account();
        acc.Name ='hello';
        acc.Phone ='345678';
        insert acc;
        
        Contact con = new Contact ();
        con.lastName = 'Gone';
        con.AccountId = acc.Id;
        insert con;
        
        Contact con1 = new Contact ();
        con1.lastName = 'Goa';
        con1.AccountId = acc.Id;
        insert con1;
        
        List<Id> accountIds = new List<Id>();
        accountIds.add(acc.Id);
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
       
        
    }

}