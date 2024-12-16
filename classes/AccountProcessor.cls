public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
        
        if (!accountIds.isEmpty()) {
            List<AggregateResult> results = [SELECT AccountId, COUNT(Id) contactCount
                                             FROM Contact 
               								 WHERE AccountId IN :accountIds
               								 GROUP BY AccountId];
     
            Map<Id, Integer> mapOfContactCounts = new Map<Id, Integer>();
            for (AggregateResult result : results) {
                mapOfContactCounts.put( (Id) result.get('AccountId'),(Integer) result.get('contactCount') );
           }
            
            List<Account> accountsToUpdate = new List<Account>();
            for (Id idOfAccount : mapOfContactCounts.keySet()) {
                accountsToUpdate.add(new Account( Id = idOfAccount,  Number_Of_Contacts__c = mapOfContactCounts.get(idOfAccount)));
           }
            
            if (!accountsToUpdate.isEmpty()) {
                update accountsToUpdate;
                
            }
            
        }
    }
}
