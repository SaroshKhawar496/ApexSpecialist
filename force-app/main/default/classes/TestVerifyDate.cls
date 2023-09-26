@isTest
private class TestVerifyDate {

    @IsTest
    static void test_Within30days(){
        Date date1 = Date.valueOf('2023-09-01');
        Date date2 = Date.valueOf('2023-09-26');
        Test.startTest();
        Date result = VerifyDate.CheckDates(date1, date2);
        Test.stopTest();
        Assert.areEqual(result, date2);
    }
    @IsTest
    static void test_Outside30days(){
        Date date1 = Date.valueOf('2023-09-01');
        Date date1_eom = Date.valueOf('2023-09-30');
        Date date2 = Date.valueOf('2024-09-26');
        Test.startTest();
        Date result = VerifyDate.CheckDates(date1, date2);
        Test.stopTest();
        Assert.areEqual(result, date1_eom);
    }
}