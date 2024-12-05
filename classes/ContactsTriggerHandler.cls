public class ContactsTriggerHandler {
    
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
                    thisContact.adderror('Must contain');
                    
                }
                
            }
        }

        }
        }
        
    }
 
}
