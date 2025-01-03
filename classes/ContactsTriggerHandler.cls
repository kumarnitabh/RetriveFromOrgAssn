public class ContactsTriggerHandler {
    
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
    
    
    public static void checkEmailInAccountDomain (List<Contact> newListOfContacts){
        
        Set<Id> accIds = new Set<Id>();       
        for(contact thisContact :newListOfContacts){
            
            if(thisContact !=null){
                accIds.add(thisContact.AccountId);    
            }
            
            Map<Id, String> domainOfAccount =new Map<Id, String>();
            if(!accIds.isEmpty()){
                for(Account fetchAccount : [SELECT Id, Domain__c FROM Account WHERE Id IN :accIds]){
                    
                    if(fetchAccount.Domain__c !=null ){
                        domainOfAccount.put(fetchAccount.Id, fetchAccount.Domain__c);
                    }
                }
                
                for (Contact containContact : newListOfContacts){
                    
                    if(thisContact.AccountId !=null && thisContact.Email !=null ){
                        String checkingContains = domainOfAccount.get(thisContact.AccountId);
                        if(!thisContact.email.contains(checkingContains)){
                            thisContact.adderror('Email must contain Domain of associated Account');
                            
                        }
                        
                    }
                }
                
            }
        }
        
    }
}