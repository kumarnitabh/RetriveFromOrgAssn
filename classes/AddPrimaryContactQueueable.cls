public class AddPrimaryContactQueueable implements Queueable {

    private Contact contacts;
    private String abbreviationOfState;
    
    public AddPrimaryContactQueueable(Contact con, String stateAbb){
            this.contacts = con;
            this.abbreviationOfState = stateAbb;
    }

    public void execute(QueueableContext qc){

        List<Account> acc =[SELECT Id, BillingState FROM Account WHERE BillingState = :abbreviationOfState LIMIT 200];
        List<Contact> listOfContact = new List<contact>();
        for(Account thisAccount : acc){ 
            Contact cloneContact = contacts.clone(false, false, false, false);
            cloneContact.AccountId=thisAccount.Id;
            listOfContact.add(cloneContact);
            }
        if(!listOfContact.isEmpty()){
            insert listOfContact;
        }
        }
    
}
