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

    
    public static void fetchingUsingCriteriaBased(Id sessionId, String dateOfSession){
        Date sessionDate = Date.valueof(dateOfSession);
        
         List<Training_Session__c> fetchRecordUsingAttendeeRecords = [SELECT Name, Session_Date__c, Loaction__c, RecordTypeId FROM
                                                                        Training_Session__c WHERE RecordTypeId = :sessionId and 
                                                                        Session_Date__c = :sessionDate];

            
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
    
    
    public static void bulkInsertTrainingSession(){
        
        List<Training_Session__c> insertRecords = new List<Training_Session__c> {new Training_Session__c(Name='Praveen', Loaction__c ='Hyderabad'), 
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
        
    public static void bulkUpdateTrainingSession(String naming, String askDate){
            
            Date sessionDate = Date.valueof(askDate);
            
            Training_Session__c fetchRecord =[SELECT Name, Loaction__c, Session_Date__c 
                                              FROM Training_Session__c WHERE Name = :naming and Session_Date__c = :sessionDate];
            fetchRecord.Loaction__c = 'Pune';
            fetchRecord.Name = 'Har';
            
            Database.SaveResult updatedList = Database.update(fetchRecord, false);
            
            if(updatedList.isSuccess()){
                
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
  
    public static void deleteExistingRecord(String nameOfSession, String place){
                
            Training_Session__c deleteRecords=[SELECT Name, Loaction__c, Session_Date__c FROM Training_Session__c 
                                                WHERE Name = :nameOfSession and Loaction__c = :place ];
                
            database.deleteresult recordsDeleted = Database.delete(deleteRecords);
                
            if(recordsDeleted.isSuccess()){
                    
                System.debug('Successfully deleted ');
                }
                
                else{
                    
                System.debug('Wrong details to fetch No match is found to delete records.');
                }
            
    }
    
}
