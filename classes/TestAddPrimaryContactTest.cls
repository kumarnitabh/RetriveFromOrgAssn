@isTest
public class TestAddPrimaryContactTest {
    
    @isTest
    static void testQueueableContactCreate(){
        
        Contact con = new Contact();
        con.LastName = 'TestQueue';
        insert con;
        
        for(Integer i =1; i<50; i++){
            Account acc = new Account();
            acc.Name ='Test Account'+i;
            acc.Phone ='987567';
            acc.BillingState ='NY';
            insert acc;
        }
        
        for(Integer i =1; i<50; i++){
            Account thisAccount = new Account();
            thisAccount.Name ='Test Account'+i;
            thisAccount.Phone ='234567';
            thisAccount.BillingState ='CA';
            insert thisAccount	;
        }
        
        AddPrimaryContactQueueable apc = new AddPrimaryContactQueueable(con,'CA');
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
        
        Integer contactCount = [SELECT count() FROM Contact];
        Assert.areEqual(50, contactCount);
        
        
    }

}