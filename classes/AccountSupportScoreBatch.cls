global class AccountSupportScoreBatch implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        
        
        return Database.getQueryLocator('SELECT Id, Priority, Status, AccountId FROM case WHERE Status != \'Closed\' ' );
        
    }
    global void execute (Database.BatchableContext bc ,List<Case> caseList){
        
        Set<Id> accIds = new Set<Id>();
        for(Case thisCase: caseList){
            if(thisCase.AccountId != null){
                accIds.add(thisCase.AccountId);
            }
        }
        
        Map<Id, Account> accList = new Map<Id, Account>([SELECT Id, Support_Score__c FROM Account WHERE Id IN : accIds ]);
        List<Account> updatedAccount = new List<Account>();
        List<Account> updatedAccounts = new List<Account>();
        
        for(Case updateCase : caseList){
            if(updateCase.Status !='Closed' & updateCase.AccountId != null){
                accList.containsKey(updateCase.AccountId);
                if(updateCase.Priority == 'High'){ 
                    Account acc = new Account();
                    acc.Id = updateCase.AccountId;
                    if(acc.Support_Score__c == null){
                        acc.Support_Score__c =0;
                    }
                    acc.Support_Score__c = accList.get(updateCase.AccountId).Support_Score__c +3;
                    updatedAccount.add(acc);
                }
                if(updateCase.Priority == 'Medium'){
                    Account acc = new Account();
                    acc.Id = updateCase.AccountId;
                    if(acc.Support_Score__c == null){
                        acc.Support_Score__c =0;
                    }
                    acc.Support_Score__c = accList.get(updateCase.AccountId).Support_Score__c +2;
                    updatedAccount.add(acc);
                }
                if(updateCase.Priority == 'Low'){
                    Account acc = new Account();
                    acc.Id = updateCase.AccountId;
                    if(acc.Support_Score__c == null){
                        acc.Support_Score__c =0;
                    }
                    acc.Support_Score__c = accList.get(updateCase.AccountId).Support_Score__c +1;
                    updatedAccount.add(acc);
                }
            }
        }
        try {
            update updatedAccount;
        }catch(Exception e){
            System.debug(e.getMessage());
        }
        
  /*      for(Case updateCAse : caseList){
            if(updateCase.CreatedDate.Date()-Date.today() <30){
                accList.containsKey(updateCase.AccountId);
                Account acc = new Account();
                    acc.Id = updateCase.AccountId;
                    if(acc.Support_Score__c == null){
                        acc.Support_Score__c =0;
                    }
                    acc.Support_Score__c = accList.get(updateCase.AccountId).Support_Score__c +1;
                    updatedAccounts.add(acc); 
            }
             if(updateCase.CreatedDate.Date()-Date.today() <60){
                accList.containsKey(updateCase.AccountId);
                Account acc = new Account();
                    acc.Id = updateCase.AccountId;
                    if(acc.Support_Score__c == null){
                        acc.Support_Score__c =0;
                    }
                    acc.Support_Score__c = accList.get(updateCase.AccountId).Support_Score__c -1;
                    updatedAccounts.add(acc); 
            }
        }
        try {
            update updatedAccounts;
        }catch(Exception e){
            System.debug(e.getMessage());
        }*/
        
    }
    global void finish(Database.BatchableContext bc){
        
    }

}