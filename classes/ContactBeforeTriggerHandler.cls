/**
 * Description : This class is created to validate Field on Contact.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 09/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */


public class ContactBeforeTriggerHandler {
    
    public static String str ='Email must contain Domain of associate Account.';
    
/**
 * Description : This method is created to validate Email field on Contact.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 09/12/2024
 * 
 * Revision Logs :  V_1.0 - Created
 * 
 */

   public static void validateEmailOnContact(List<Contact> newListOfContact, map<Id, Contact> oldMap){
        
        Map<Id, String> mapEmailOfContact = new Map<Id, String>();
        for(Account thisAccount : [Select Id, Domain__c from Account]){
            mapEmailOfContact.put(thisAccount.Id, thisAccount.Domain__c);
        }
        for(Contact thisContact : newListOfContact){
            if(thisContact.AccountId != null && thisContact.Email != null){ 
                if(thisContact.Email.substringAfter('@').toLowerCase() != mapEmailOfContact.get(thisContact.AccountId)){ 
                thisContact.addError('Email must contain Domain of associate Account.');
                }
            
            
        } 
    }
    
    }
    
       public static void dynamicUpdateField(List<Contact> listOfContact, Map<Id, Contact> mapOfContact){
       
        for(Contact con : listOfContact){            
            
            if((mapOfContact == null  && String.isNotBlank(con.RecordId__c) && con.RecordId__c.length() == 18 )  ||
               
               (mapOfContact != null && mapOfContact.get(con.Id).RecordId__c != con.RecordId__c && 
                
                String.isNotBlank(con.RecordId__c) && con.RecordId__c.length() == 18 ) ){                                                           
                    
                    Id recordId = Id.valueOf(con.RecordId__c);
                    Schema.SObjectType sObjectName = recordId.getSobjectType();
                    con.Object_Name__c = ((Id)recordId).getSobjectType().getDescribe().getName();                                      
                    Schema.DescribeSObjectResult sObjectResult = sObjectName.getDescribe();
                    
                    List<string> picklistFieldsNames = new List<string>();
                    for(Schema.SObjectField sObjfield  : sObjectResult.fields.getMap().values()){
                        
                        Schema.DescribeFieldResult fieldResult = sObjfield.getDescribe();
                        
                        if(fieldResult.getType() == Schema.DisplayType.PICKLIST){
                            picklistFieldsNames.add(fieldResult.getName());                                               
                        }
                    } 
                    if(!picklistFieldsNames.isEmpty())
                    {
                        con.Picklist_Field__c = '';
                        for(String val : picklistFieldsNames)
                        {
                            con.Picklist_Field__c += val + '\n';       
                        }
                    }                
                }                          
            if(con.RecordId__c == null){
                
                con.Object_Name__c = null;
                con.Picklist_Field__c = null;
            }       
        }
        
        
    }

}