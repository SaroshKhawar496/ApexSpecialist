@isTest
private class AnimalLocatorTest {
    @IsTest
    static void testGetAnimalNameById(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String name = AnimalLocator.getAnimalNameById(1);
        System.debug('String returned: '+name);
        
    }
}