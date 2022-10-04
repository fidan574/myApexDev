@isTest
public with sharing class CaseManagerTest {
    @TestSetup
    Static void makeData(){
        //create an account , a contact and 4 cases
        Account acc= new Account(Name ='Test Account');
        insert acc;

        Contact con = new Contact(FirstName='Integration', LastName='Test', Email='test@test.com');
        insert con;

        List<Case> cases = new List<Case>();
        for(Integer i=0; i<4; i++) {
            Case cs = new Case();
            cs.AccountId = acc.Id;
            cs.ContactId = con.Id;
            cs.Subject = 'Problem with the Wi-Fi Routor ' + i;
            cs.Description = 'There was a problem with my Wi-Fi routor since morning. I do not get data';
            cs.Origin = 'Email';
            cs.Priority = 'Medium';
            cases.add(cs);
        }
        insert cases;

    }
    @isTest
    private static void getCaseTest(){
        Case cs = [SELECT Id, Subject, CaseNumber, Description, Priority, Origin FROM Case LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm(); //Base url
        String uri = homeUrl + 'services/apexrest/Case/' + cs.Id;
        
        Test.startTest();
        //prepare restrequest and context
        RestRequest request = new RestRequest();
        request.requestURI= uri;
        request.httpMethod = 'GET';
        RestContext.request = request;

        //test the method and perform asserts
        Case objCase = CaseManager.getCase();
        System.assert(objCase.Id != null);
        System.assertEquals(objCase.Subject, cs.Subject);
        System.assertEquals(objCase.CaseNumber, cs.CaseNumber);
        Test.stopTest();
    }

    @isTest
    private static void createCaseTest() {
        Test.startTest();
        Id caseId  = CaseManager.createCase('Test Subject', 'Web', 'High', 'Test Desc');
        System.assert(caseId != Null);
        Test.stopTest();
    }
    @IsTest
    private static void deleteCaseTest(){
        Test.startTest();
         //prepare request uri
        Case cs = [SELECT Id, Subject, CaseNumber, Description, Priority, Origin FROM Case LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm(); //Base url
        String uri = homeUrl + 'services/apexrest/Case/' + cs.Id;

        //prepare Restrequest & Context
        RestRequest request = new RestRequest();
        request.requestURI= uri;
        request.httpMethod = 'DELETE';
        RestContext.request = request;

        //Test deleteCase method and perform asserts
        String actual = CaseManager.deleteCase();
        System.assertEquals('Case has been deleted successfully', actual);

        Test.stopTest();
    }

    @IsTest
    Private static void upsertCaseTest1(){

        Test.startTest();
        //do not send case id and observe if a case is getting created
        Id caseId  = CaseManager.upsertCase(null, 'Subject', 'Web', 'High', 'description');
        System.assert(caseId != null);
        Test.stopTest();
        
    }
    @IsTest
    Private static void upsertCaseTest2(){
        Case cs = [SELECT Id, CaseNumber FROM Case LIMIT 1];
        Test.startTest();
        //do not send case id and observe if a case is getting created
        Id caseId  = CaseManager.upsertCase(cs.Id, 'Subject', 'Web', 'High', 'description');
        System.assertEquals(cs.Id, caseId);
        Test.stopTest();
    }

    @IsTest
    static void updateCaseTest(){
    
        Test.startTest();
        //prepare json string and convert if into blob
        Case cs = [SELECT Id, Subject, Description, Reason FROM Case LIMIT 1];
        cs.Reason = 'Installation';
        String jsonString = JSON.serialize(cs);
        
        //prepare RestRequest and Context
        RestRequest request = new RestRequest();
        request.requestBody = Blob.valueOf(jsonString);
        request.httpMethod = 'PATCH';
        RestContext.request = request;


        //Test the method ad perform asserts
        Case updatedCase = CaseManager.updateCase();
        System.assertEquals('Installation', updatedCase.Reason);
        Test.stopTest();
        
    }


}
