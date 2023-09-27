@isTest
private class LeadProcessorTest {
    @TestSetup
    static void makeData(){
        List<Lead> testLeads = new List<Lead>();
        for(Integer i=0; i<200; i++){
            testLeads.add(new Lead(
                LastName = 'TestLead' +i,
                Company = 'Me'
            ));
        }
        insert testLeads;
    }
    @IsTest
    static void testBatchApex(){
        Test.startTest();
        Database.executeBatch(new LeadProcessor());
        Test.stopTest();
        
    }
}