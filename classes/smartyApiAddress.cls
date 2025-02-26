public class smartyApiAddress {
    
    @future(callout=true)
    public static void validateAddressWithApi(Set<Id> conId){
        
        List<Contact> conDetails = [SELECT Id, MailingCity, MailingStreet, Address_Verified__c, MailingState FROM Contact WHERE Id IN: conId];
        Set<Id> contactIdsUpdate = new Set<Id>();
        for(Contact thisContact :conDetails){
            String street = EncodingUtil.urlEncode(thisContact.MailingStreet, 'UTF-8');
            String city = EncodingUtil.urlEncode(thisContact.MailingCity, 'UTF-8');
            String state = EncodingUtil.urlEncode(thisContact.MailingState, 'UTF-8');
            
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://us-street.api.smarty.com/street-address?street='+street+'&city='+city+'&state='+state+'&auth-id=29a4e07d-6489-b848-a490-1c6cef0ef742&auth-token=agzP3n7Osf4AhB42yZxh&candidates=10');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                String responseBodyy = response.getBody();
                if(!responseBodyy.contains('[]')){
                    contactIdsUpdate.add(thisContact.Id);  
                }	 
            } 
        }updateContact(contactIdsUpdate);
    }   
 
    public static void updateContact(Set<Id> contactIdsUpdate){
        
        List<Contact> contactToUpdate = new List<Contact>();
        
        for(Id newCon : contactIdsUpdate){
            
            Contact thisContact = new Contact();
            thisContact.Id = newCon;
            thisContact.Address_Verified__c = true;
            contactToUpdate.add(thisContact);
        }
        update contactToUpdate;
    }
}