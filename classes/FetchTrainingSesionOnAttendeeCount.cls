/**
 * Description : This class is created to insert, update and delete bulk records.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 02/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */


public class FetchTrainingSesionOnAttendeeCount {
    
    
/**
 * Description : This method is created to fetch records of training sessions based on specific criteria.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 02/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */

    
    public static void fetchingUsingCriteriaBased(String str, String dt){
        date dtt = date.valueof(dt);
        
         list<Training_Session__c> fetchRecordUsingAttendeeRecords = [Select Name ,Session_Date__c, Loaction__c	, RecordTypeId from
                                                                        Training_Session__c Where RecordTypeId = :str and 
                                                                        Session_Date__c = :dtt ];

            
            System.debug(fetchRecordUsingAttendeeRecords);
        } 
    
    
/**
 * Description : This method is created to insert new records and use custom labels to generate messages.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 02/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */
    
    
    public static void bulkInsertInTrainingSession(){
        
        List<Training_Session__c> insertRecords = new list<Training_Session__c> { new Training_Session__c( Loaction__c ='Hyderabad'), 
            new Training_Session__c(Name='Raj', Loaction__c ='Bangalore')};
            
            Database.SaveResult[] recordList = Database.insert(insertRecords, false);
        
        	for (Database.SaveResult listOfRecord :recordList ) {
    			if (listOfRecord.isSuccess()) {
        
                    System.debug('Successfully inserted account.');
                }
                else {
                           
                    System.debug(System.label.Error_For_Wrong_Desp);
                        
                        
                    }                 
   		 }
    }

 /**
 * Description : This method is created to update the existing key field in Training session object use custom labels to generate messages.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 02/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */
        
    public static void bulkUpdateTrainingSession(string Naming, string dat){
            
            date datee = date.valueof(dat);
            
            Training_Session__c fetchRecord =[select Name, Loaction__c, Session_Date__c 
                                              from Training_Session__c where Name = :Naming and Session_Date__c =:datee];
            fetchRecord.Loaction__c ='Pune';
            fetchRecord.Name ='Har';
            
            Database.saveResult updatedlist = database.update(fetchRecord,false);
            
            if(updatedlist.isSuccess()){
                
                System.debug('Successfully updated');
            }
            else{
                System.debug('Details entered are wrong. Update cancelled !');
 
            }
        }
            
/**
 * Description : This method is created to delete the existing records in Training session object use custom labels to generate messages.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 02/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */    
  
    public static void deleteExistingRecord(String Na, String Loc){
                
            Training_Session__c deleteRecords=[select Name, Loaction__c, Session_Date__c from Training_Session__c 
                                                where Name = :Na and Loaction__c =:loc ];
                
            database.deleteresult RecordsDeleted = Database.delete(deleteRecords);
                
            if(RecordsDeleted.issuccess()){
                    
                System.debug('Successfully deleted ');
                }
                
                else{
                    
                System.debug('Wrong details to fetch No match is found to delete records.');
                }
            
    }
    
}
