/*                                                          
 * Description : This class is created to Perform different DML operations  on Training_Session__c objects.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 27/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */

public class TrainingSessionManager {

/*   
 * Description : This method is created to insert new records in Training_Session__c objects.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 27/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */
    public static void createTrainingSessionRecords() {

        list<Training_Session__c > addTrainingSessionRecords = new list<Training_Session__c >();
		addTrainingSessionRecords.add(new Training_Session__c(Name='Dhruv',Loaction__c='India'));
        addTrainingSessionRecords.add(new Training_Session__c(Name='Harsh',Loaction__c='England'));
        insert addTrainingSessionRecords;
  
    }
/*   
 * Description : This method is created to update existing records in Training_Session__c objects.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 27/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */
    public static void updateTrainingSessionRecords() {

        Training_Session__c updateTrainingSessionRecords = new Training_Session__c();
        updateTrainingSessionRecords = [Select ID,Loaction__c,Name from Training_Session__c Where Id ='a03dL00000CS621QAD'] ;
        updateTrainingSessionRecords.Loaction__c='Africa';
        update updateTrainingSessionRecords;

}
/* 
 * Description : This method is created to delete existing records in Training_Session__c objects.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 27/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */
    
    public static void deleteRecordsOfTrainingSessions(){
        Training_Session__c deleteTrainingSessionsRecords =new Training_Session__c();
        deleteTrainingSessionsRecords = [Select ID from Training_Session__c Where Id ='a07dL00000GRMgfQAH'] ;
        delete deleteTrainingSessionsRecords;

}
/* 
 * Description : This method is created to read records from Teacher__c objects.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 27/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */
    
    public static void readRecordsOfTrainingSessions(){
        Training_Session__c readTrainingSessionsRecords =new Training_Session__c();
        readTrainingSessionsRecords = [Select ID, Name,Loaction__c,RecordTypeId from Training_Session__c limit 5] ;
    

}
/* 
 * Description : This method is created to add attendees record to a training session query ensuring attendee is added once .
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 27/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */
    
   
 public static void addAttendeeToTrainingSession(){
    list<Training_Session__c> addAttendeeRecordsInTrainingSession = new list<Training_Session__c>()  ;
    addAttendeeRecordsInTrainingSession = [Select Id, Name from Training_Session__c ];
    set<Training_Session__c> setUniqueTrainingSessionRecords  = new set<Training_Session__c>() ;
    for (Training_Session__c recordsTrainingSession : addAttendeeRecordsInTrainingSession){
        setUniqueTrainingSessionRecords.add(recordsTrainingSession);
    }
    System.debug(setUniqueTrainingSessionRecords);
    
}

/* 
 * Description : This method is created to use enum within the class to categorize record type .
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 28/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */
    
 public enum Department {WEBINAR, WORKSHOP, SEMINAR}

    public static void  trainingSessionsEnum(){

        Training_Session__c fetchingRecordsTrainingSession = [select Record_value__c from Training_Session__c limit 1];
        
        if(fetchingRecordsTrainingSession.Record_value__c == 'Webinar'){
            System.debug('Workshop');
            
        }else{
             System.debug('Seminar');

        }
}
/* 
 * Description : This method is created to safely navigates through the relationships.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 28/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */
    
    public static void safeNavigation(string trainingSessionId){

        List<Training_Session__c> fetchRecord = [
            SELECT Id, Name ,(SELECT Id, Name FROM Attendees__r) FROM Training_Session__c 
             WHERE Id = :trainingSessionId LIMIT 1];     
        
        if (!fetchRecord.isEmpty() && fetchRecord[0]?.attendees__r !=NULL) {
           
             for (Attendee__c attendee : fetchRecord[0].attendees__r) {
                System.debug('Attendee: ' + attendee.Name);
             }
        }
        else{
             System.debug('No attendees found for this training session.');   
         }

}

/* 
 * Description : This method is created to fetch all Training_Session__c records and their related Attendee__c records.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 29/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */

public static void fetchTrainingSessionAndAttendee(){
    list<Training_Session__c> fetchingRecordsTrainingSessionAndAttendee ;
    fetchingRecordsTrainingSessionAndAttendee = [Select Id, Name, Loaction__c, Avg_Rating__c ,(Select Name, Phone__c, Email__c from Attendees__r) from Training_Session__c ];
    
    for(Training_Session__c trainingRecord : fetchingRecordsTrainingSessionAndAttendee){
        System.debug(trainingRecord);
        for(Attendee__c attendeeRecord : trainingRecord.Attendees__r){
            System.debug(attendeeRecord); 

        }  
    }
}
/* 
 * Description : This method is created to insert bulk new records in Training_Session__c objects.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 29/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */

    public static void dmlInsertOperationOnTrainingSession(){

        list<Training_Session__c> insertRecordOnTrainingSession =new list<Training_Session__c>();
        insertRecordOnTrainingSession.add(new Training_Session__c(Name='Alex',Loaction__c='Australia'));
        insertRecordOnTrainingSession.add(new Training_Session__c(Name='Liam',Loaction__c='Africa'));
        insert insertRecordOnTrainingSession;
}
/* 
 * Description : This method is created to update bulk existing records in Training_Session__c objects.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 29/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */

    public static void dmlUpdateOperationOnTrainingSession(){
        Training_Session__c updateOperationOnTrainingSession = new Training_Session__c();
        updateOperationOnTrainingSession =[Select Id, Name, Loaction__c from Training_Session__c Where Name ='Alex'];
        updateOperationOnTrainingSession.Name = 'Alexa';
        update updateOperationOnTrainingSession;
        
}
/* 
 * Description : This method is created to delete bulk existing records in Training_Session__c objects.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 29/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */

 public static void dmlDeleteOperationOnTrainingSession(){
    Training_Session__c deleteOperationOnTrainingSession = new Training_Session__c();
    deleteOperationOnTrainingSession =[select Id from Training_Session__c where Id='a03dL00000CYf1xQAD'];
    delete deleteOperationOnTrainingSession;

}



}