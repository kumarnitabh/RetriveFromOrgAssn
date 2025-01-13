global class BatchSobjectRecords implements Database.Batchable<SObject>, Database.stateful, Schedulable{
    
    String ObjectName;
    global  BatchSobjectRecords(String ObjectApiName){
        ObjectName=ObjectApiName;
    }
    
    private List<String> deletedRecords = new List<String>();
    global Database.QueryLocator start(Database.BatchableContext bc){
        List<Archive_Config__mdt> acm = [SELECT Developer_Name__c, Filter__c, Duration__c FROM Archive_Config__mdt WHERE Developer_Name__c =: ObjectName ];
        return Database.getQueryLocator('SELECT Id, Name FROM ' + acm[0].Developer_Name__c + ' WHERE ' + acm[0].Filter__c 
                                        + ' AND CreatedDate >= LAST_N_DAYS: ' +acm[0].Duration__c );
    }
    
    global void execute(Database.BatchableContext bc, List<sObject> recordsOfSObject ){
        String csvheader = 'Id' + '\n';
        String csvData = csvheader;
        
        for(sObject sbc : recordsOfSObject){
            csvData += sbc.Id + '\n';
        }
        deletedRecords.add(csvData);
        delete recordsOfSObject; 
    }
    
    global void finish(Database.BatchableContext bc){
        String finalcsData = '';
        for(String csvdata : deletedRecords){
            finalcsData += csvdata;
        }  
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        String[] recipients = new String[]{'nitabh.kumar@fexle.com'};
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setFileName('DeletedRecords.csv');
        attachment.setBody(Blob.valueOf(finalcsData));
        message.setFileAttachments(new Messaging.EmailFileAttachment[]{attachment});
        message.setToAddresses(recipients);
        message.setSubject('Deleted Records Report');
        message.setHtmlBody('Please find the attached CSV file containing the records that were deleted.');
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{message});
    }
    
    global void execute (SchedulableContext sc){
        
      //  BatchSobjectRecords bsfc = new BatchSobjectRecords();
        //Database.executeBatch(bsfc,1);
        //String str = '0 0 1 * * ?';
        //System.Schedule('Every Month', str, bsfc);
        
    }
}