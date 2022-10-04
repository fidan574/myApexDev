@isTest
public with sharing class AccountManagerTestClass {
    @TestSetup
    Static void makeData(){

        List<Account> accs = new List<Account>();
        for(Integer i=0; i<4; i++) {
            Account acc= new Account();
            acc.Name = 'Chemical Innovation ' + i;
            acc.Industry = 'Chemicals';
            acc.Type = 'Prospect';
            acc.Description = 'Laboratuar part';
            accs.add(acc);
        }
        insert accs;

    }
    @isTest
    private static void getAccountTest(){
        Account acc = [SELECT Id, Name, Industry, Type, Description FROM Account LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm(); //Base url
        String uri = homeUrl + 'services/apexrest/Account/' + acc.Id;
        
        Test.startTest();
        //prepare restrequest and context
        RestRequest request = new RestRequest();
        request.requestURI= uri;
        request.httpMethod = 'GET';
        RestContext.request = request;

        //test the method and perform asserts
        Account objAcc = AccountManager.getAccount();
        System.assert(objAcc.Id != null);
        System.assertEquals(objAcc.Type, acc.Type);
        System.assertEquals(objAcc.Description, acc.Description);
        Test.stopTest();
    }

    @isTest
    private static void createAccountTest() {
        Test.startTest();
        Id accId  = AccountManager.createAccount('Chemical Innovation 1', 'Chemicals', 'High', 'Test');
        System.assert(accId != Null);
        Test.stopTest();
    }
    @IsTest
    private static void deleteAccountTest(){
        Test.startTest();
         //prepare request uri
        Account acc = [SELECT Id, Name, Industry, Type, Description FROM Account LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm(); //Base url
        String uri = homeUrl + 'services/apexrest/Account/' + acc.Id;

        //prepare Restrequest & Context
        RestRequest request = new RestRequest();
        request.requestURI= uri;
        request.httpMethod = 'DELETE';
        RestContext.request = request;

        //Test deleteAccount method and perform asserts
        String actual = AccountManager.deleteAccount();
        System.assertEquals('Account has been deleted successfully', actual);

        Test.stopTest();
    }

    @IsTest
    Private static void upsertAccountTest1(){

        Test.startTest();
        //do not send accout id and observe if an account is getting created
        Id accId  = AccountManager.upsertAccount(null, 'Chemical Innovation 2', 'Chemicals', 'Test');
        System.assert(accId != null);
        Test.stopTest();
        
    }
    @IsTest
    Private static void upsertAccountTest2(){
        Account acc = [SELECT Id, Name FROM Account LIMIT 1];
        Test.startTest();
        //do not send account id and observe if a account is getting created
        Id accountId  = AccountManager.upsertAccount(acc.Id, 'Chemical Innovation 3', 'Chemicals', 'Test');
        System.assertEquals(accountId, acc.Id);
        Test.stopTest();
    }

    @IsTest
    static void updateAccountTest(){
    
        Test.startTest();
        //prepare json string and convert if into blob
        Account acc = [SELECT Id, Name, Industry, Type, Description FROM Account LIMIT 1];
            acc.Type = 'Prospect';
        String jsonString = JSON.serialize(acc);
        
        //prepare RestRequest and Context
        RestRequest request = new RestRequest();
        request.requestBody = Blob.valueOf(jsonString);
        request.httpMethod = 'PATCH';
        RestContext.request = request;


        //Test the method ad perform asserts
        Account updatedAccount = AccountManager.updateAccount();
        System.assertEquals('Prospect', updatedAccount.Type);
        Test.stopTest();
        
    }
}


