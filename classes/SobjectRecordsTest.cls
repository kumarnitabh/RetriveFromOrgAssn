@isTest
public class SobjectRecordsTest {
    @isTest(seeAllData=True)
    static void testBatchExecution() {
        
       List<Archive_Config_mdt__mdt> acm = [SELECT Developer_Name__c, Filter__c, Duration__c 
                                         FROM Archive_Config_mdt__mdt 
                                         WHERE Developer_Name__c =  'Account' LIMIT 1 ];
        
        BatchSobjectRecords batchInstance = new BatchSobjectRecords('Account');

        Test.startTest();
        Database.executeBatch(batchInstance, 2); 
        Test.stopTest();
        
        List<sObject> records =  Database.Query('SELECT Id, Name FROM ' + acm[0].Developer_Name__c + ' WHERE ' + acm[0].Filter__c 
                                        + ' AND CreatedDate >= LAST_N_DAYS: ' +acm[0].Duration__c );

        Assert.areEqual(0, records.size(), 'The number of processed records should match.');

    }
}