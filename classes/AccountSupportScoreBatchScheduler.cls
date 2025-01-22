global class AccountSupportScoreBatchScheduler implements Schedulable {
    
    global void execute (System.SchedulableContext sc){
        
        AccountSupportScoreBatch  batch = new AccountSupportScoreBatch();
        String str = '0,0,1,0,1';
       // System.Schedule('Execute', batch ,str);
        
    }

}