public with sharing class AccountManagerController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {

        return [SELECT Name, Phone, Rating, Industry, Type FROM Account];
    }
}