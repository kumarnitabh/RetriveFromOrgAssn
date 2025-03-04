public class AccountRecordFetch {
    @AuraEnabled(cacheable=true)
    
    public static List<Account> recordOfAccount() {

        List<Account> accList = [SELECT Id, Name, Industry, Phone FROM Account];

        return accList;

    }
    @AuraEnabled
    
    public static Account accountCreate(Account accRecord) {
        
        insert accRecord;
        return accRecord;
    
}
    @AuraEnabled
    
    public static void contactCreate (Contact conRecord){
        insert conRecord;
    }
}