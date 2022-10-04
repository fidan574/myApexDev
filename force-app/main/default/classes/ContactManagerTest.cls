@isTest
public with sharing class ContactManagerTest {
    @TestSetup
    static void makedata() {
        Account acc = new Account(Name='Test Account');
        insert acc;
        List<Contact> contacts = new List<Contact>();
        for(Integer i=0; i<4; i++) {
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.FirstName = 'Problem with the Wi-Fi Routor ' + i;
            con.LastName = 'There was a problem with my Wi-Fi routor since morning. I do not get data';
            con.Email = 'a_young23@dickenson.com';
            con.Title = 'SVP, Operations23';
            con.Department = 'Internal Operations23';
            contacts.add(con);
        }
        insert contacts;
    }
    @isTest
    private static void getContactTest() {
        //prepare request uri
        Contact con = [SELECT Id, FirstName, LastName, Email, Title, Department FROM Contact LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm(); //Base URL
        String uri = homeUrl + '/services/apexrest/Contact/' + con.Id;
        //prepare restrequest and context
        RestRequest request = new RestRequest();
        request.requestURI = uri;
        request.httpMethod = 'GET';
        RestContext.request = request;
        //test the method and perform asserts
        Contact objContact = ContactManager.getContact();
        System.assert(objContact.Id != null);
    }
    @istest
    private static void createContactTest(){
        Test.startTest();
        Id contactId = ContactManager.createContact('Ilker', 'Altintas', 'Title Test', 'a@gmail.com', 'SVP');
        system.assert(contactId != null);
        Test.stopTest();
    }
    @istest
    private static void deleteContactTest(){
        Test.startTest();
        Contact con = [SELECT Id, FirstName, LastName, Email, Title, Department FROM Contact LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm(); //Base URL
        String uri = homeUrl + '/services/apexrest/Contact/' + con.Id;
        RestRequest request = new RestRequest();
        request.requestURI = uri;
        RestContext.request = request;
        string actual =ContactManager.deleteContact();
        system.assertEquals('Contact has been deleted successfully!', actual);
        Test.stopTest();
    }
    @istest
    private static void upsertContactTest(){
        test.startTest();
        Id contactId = ContactManager.upsertContact(null,'Ilker', 'Altıntas', 'Test Title', 't@gmail.com', 'SVP');
        system.assert(contactId != null);
        test.stopTest();
    }
    @istest
    private static void updateContactTest(){
        test.startTest();
        Contact con = [SELECT Id, FirstName, LastName, Email, Title, Department FROM Contact LIMIT 1];
        String jsonString = JSON.serialize(con);
        RestRequest request = new RestRequest();
        request.requestBody = Blob.valueOf(jsonString);
        request.httpMethod = 'PATCH';
        RestContext.request = request;
        Contact updatedContact = ContactManager.updateContact();
        system.assert(updatedContact != null);
        test.stopTest();
    }
    
}
