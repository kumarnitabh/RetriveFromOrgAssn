/**
 * Description : This Class is created to test all our logic of BatchLeadProcessor class.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 18/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */


@isTest
public class leadProcessorTest {

    @TestSetup
    static void createLead(){

        List<Lead> newRecordsOfLead = new List<Lead>();

        for(Integer i=0; i<200; i++){
            newRecordsOfLead.add(new Lead (LastName = 'Lead' +i, Company ='xyz' +i , Phone ='23456798765' +i, Status ='Open - Not Contacted'));
        }
        insert newRecordsOfLead;
        
    }
    @isTest
    static void testLeadSource(){
        Test.startTest();
        batchLeadProcessor leadprocessed = new batchLeadProcessor();
        Id batchId = Database.executeBatch(leadprocessed);
        Test.stopTest();
        Assert.areEqual(200, [SELECT count() FROM Lead Where LeadSource ='Dreamforce']);
    }
    
    
}