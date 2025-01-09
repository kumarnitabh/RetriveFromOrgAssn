public class TaskTriggerHandler {
    
    
    public static void rollUpField(List<Task> newListOfTask, Map<Id, Task> oldMap){
        
        Set<Id> accIds = new Set<Id>();
        
        for(Task thisTask: newListOfTask){
            if(thisTask.WhatId != null){
                accIds.add(thisTask.WhatId);
            }
        }
         if(!accIds.isEmpty()){
            if(oldMap== null || oldMap!= null && newListOfTask[0].Status__c != oldMap.get(newListOfTask[0].Id).Status__c ){ 
                
                List<AggregateResult> results = [SELECT WhatId, COUNT(Id) cst
                                                 FROM TASK 
                                                 WHERE Status__c = 'Closed'
                                                 GROUP BY WhatId];
                
                
                
                Map<Id, Integer> mapOfAccount = new Map<Id, Integer>();
                
                for(AggregateResult ar : results){
                    mapOfAccount.put(
                        (Id) ar.get('WhatId'), 
                        (Integer) ar.get('cst')
                    );
                    
                }
                List<Account> accList = new List<Account>();
                for(Id accountIds : mapOfAccount.keyset()){
                    accList.add(new account(
                        Id= accountIds,
                        Total_Closed_Activities__c =  mapOfAccount.get(accountIds)));
                }if(!accList.isEmpty()){
                    update accList;
                }
                
            }
        }
       
        if(oldMap!= null && newListOfTask[0] != oldMap.get(newListOfTask[0].Id) ){ 
        if(!accIds.isEmpty()){
            if(oldMap== null || oldMap!= null){ 
                List<AggregateResult> results = [SELECT WhatId, COUNT(Id) cst 
                                                 FROM EVENT 
                                                 WHERE WhatId IN : accIds 
                                                 GROUP BY WhatId];
                
                
                
                Map<Id, Integer> mapOfAccount = new Map<Id, Integer>();
                
                for(AggregateResult ar : results){
                    mapOfAccount.put(
                        (Id) ar.get('WhatId'), 
                        (Integer) ar.get('cst')
                    );
                    
                }
                List<Account> accList = new List<Account>();
                for(Id accountIds : mapOfAccount.keyset()){
                    accList.add(new account(
                        Id= accountIds,
                        Total_Activities__c =  mapOfAccount.get(accountIds)));
                }if(!accList.isEmpty()){
                    update accList;
                }
                
            }
        }
        if(oldMap== null || oldMap!= null && newListOfTask[0].Status__c != oldMap.get(newListOfTask[0].Id).Status__c ){ 
        
        List<AggregateResult> results = [SELECT WhatId, COUNT(Id)cst
                                         FROM EVENT 
                                         WHERE  Status__c = 'Open'
                                         GROUP BY WhatId];
        
        Map<Id, Integer> mapOfAccount = new Map<Id, Integer>();
        
        for(AggregateResult ar : results){
            mapOfAccount.put(
                (Id) ar.get('WhatId'), 
                (Integer) ar.get('cst')
            );
            
        }
        List<Account> accList = new List<Account>();
        for(Id accountIds : mapOfAccount.keyset()){
            accList.add(new account(
                Id= accountIds,
                Total_Open_Activities__c =  mapOfAccount.get(accountIds)));
        }if(!accList.isEmpty()){
            update accList;
        }
        
    }
    
    }
    
}
}