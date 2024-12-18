/**
 * Description : This Batch class is created to update a field in Leads.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 18/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */

global class batchLeadProcessor implements Database.Batchable<SObject>, Schedulable {
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc){

        return Database.getQueryLocator('SELECT Id, LeadSource From Lead');
    }

    global void execute (Database.BatchableContext bc , List<Lead> listOfLead){

        List<Lead> updateLead = new List<Lead>();
        for(Lead thisLead : listOfLead){
            thisLead.LeadSource ='Dreamforce';
            updateLead.add(thisLead);
            recordsProcessed = recordsProcessed+1;
        }
        update updateLead;
    }
            
    global void finish(Database.BatchableContext bc){

        System.debug(recordsProcessed + 'Records sucesfully processed.');
    }
    
     global void execute (SchedulableContext sc){
        
        batchLeadProcessor lpp = new batchLeadProcessor();
        Database.executeBatch(lpp,10);
        
        
    }
   
    
}