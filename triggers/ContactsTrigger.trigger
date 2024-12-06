trigger ContactsTrigger on Contact (before insert, before update, before delete) {
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            
            ContactsTriggerHandler.checkEmailInAccountDomain(Trigger.new);
            
        }
        
        
		}

}