public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
        List<Account> updateAccs = new List<Account>([SELECT ID,Number_Of_Contacts__c, (SELECT ID FROM Contacts) FROM Account WHERE ID IN: accountIds]);
        for(Account acc: updateAccs){
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        update updateAccs;
    }
}