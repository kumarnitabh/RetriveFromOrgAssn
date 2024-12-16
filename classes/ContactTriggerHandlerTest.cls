/**
 * Description : This Class is created to test all our logic of Contact Trigger Handler.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 11/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */


@isTest
public class ContactTriggerHandlerTest {
    @isTest
    static void validateEmailMethod(){
        
        Account acc = new Account();
        acc.Name ='Test';
        acc.Phone = '6789678';
        acc.Domain__c = 'testDomain.com';
        insert acc;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.Email ='xyz@testDomain.com';
        con.LastName ='Domain';
        insert con;
        
        Contact con1 = new Contact();
        con1.AccountId = acc.Id;
        con1.Email ='xyz@Domain.com';
        con1.LastName ='Back'; 
        try {
            insert con1;
        } catch(Exception e) {
           
             Assert.areEqual(true, e.getMessage().contains(ContactBeforeTriggerHandler.str),'Unexpected error');
        }  
        
       
    }

}
