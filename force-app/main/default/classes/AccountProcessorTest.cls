@isTest
private class AccountProcessorTest {

    @TestSetup
    static void makeData(){
        // Create a list to hold the accounts and contacts
        List<Account> accountList = new List<Account>();
        List<Contact> contactList = new List<Contact>();

        // Create two accounts with three contacts each
        for (Integer i = 0; i < 2; i++) {
            Account acc = new Account(Name = 'AccountTest ' + i);
            accountList.add(acc);

            for (Integer j = 0; j < 3; j++) {
                Contact con = new Contact(
                    FirstName = 'Contact ' + i + j,
                    LastName = 'Last Name ' + i + j,
                    AccountId = acc.Id 
                );
                contactList.add(con);
            }
        }        
        insert accountList;
        insert contactList;        
    }
    @isTest
    static void testCountContacts(){
        Map<Id,Account> accMap = new Map<Id,Account>([SELECT ID FROM Account WHERE Name LIKE '%AccountTest%']);
        Test.startTest();
        AccountProcessor.countContacts(new List<ID>(accMap.keySet()));
        Test.stopTest();
        
    }

}