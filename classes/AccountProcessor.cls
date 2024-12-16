public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
        
        List<Account> updateAccount = new List<Account>();
        List<Account> acc =[SELECT Id, Name,(SELECT Id FROM Contacts) FROM Account WHERE Id IN : accountIds];
        
        for(Account acct : acc){ 
            List<Contact> listOfContacts = acct.Contacts;
            acct.Number_Of_Contacts__c = listOfContacts.size();
            updateAccount.add(acct);
        }
        update updateAccount;
        
    }

}