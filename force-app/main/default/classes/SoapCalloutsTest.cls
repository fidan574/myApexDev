@isTest
public with sharing class SoapCalloutsTest {
    @isTest
    private static void parkServiceTest(){
        ParkServicesMock mock = new ParkServicesMock();
        Test.setMock(WebServiceMock.class, mock);
        String[] parks = SoapCallouts.getParksByCountry('Germany');
        system.assert(parks.size() != 0);
    }
    @isTest
    private static void doAddMockTest(){
        GetSumMock mock = new GetSumMock();
        Test.setMock(WebServiceMock.class, mock);
        Double outcome = SoapCallouts.getSum(10, 5);
        system.assertEquals(outcome, 15);
    }
    @isTest
    private static void doMultiplyMockTest(){
        GetMultiplyMock mock = new GetMultiplyMock();
        Test.setMock(WebServiceMock.class, mock);
        Double outcome = SoapCallouts.getMultiply(10, 5);
        system.assertEquals(outcome, 50);
    }
}
