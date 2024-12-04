public class ContactsTriggerHandler {
    
    public static void checkEmailInAccountDomain (List<Contact> newListOfContacts){
        
        Set<Id> accId = new Set<Id>();
                     
        for(contact checkContact :newListOfContacts){
            
            if(checkContact !=null){
                accId.add(checkContact.AccountId);
                
            }
        
        
        Map<Id, String> domainOfAccount =new Map<Id, String>();
        if(!accId.isEmpty()){
            for(Account fetchAccount : [SELECT Id, Domain__c FROM Account WHERE Id IN :accId]){
                
                if(fetchAccount.Domain__c !=null ){
                    
                    domainOfAccount.put(fetchAccount.Id, fetchAccount.Domain__c);
                }
            }
        
        
        for (Contact containContact : newListOfContacts){
            
            if(checkContact.AccountId !=null && checkContact.Email !=null ){
                
                String checkingContains = domainOfAccount.get(checkContact.AccountId);
                
                
                if(!checkContact.email.contains(checkingContains)){
                    
                    checkContact.adderror('Must contain');
                    
                }
                
            }
        }

        }
        }
        
    }
 
}