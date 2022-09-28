@isTest
public with sharing class RestCalloutTest {
    @isTest
    private static void getAnimalsTest(){
        RestCalloutMock mock = new RestCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.getAnimals();
        System.assertEquals(response.getStatus(), 'OK');
        System.assertEquals(response.getStatusCode(), 200);
        
    }
    @isTest
    private static void getUsersTest(){
        RestCalloutMock mock = new RestCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.getUsers();
        System.assertEquals(response.getStatus(), 'OK');
        System.assertEquals(response.getStatusCode(), 200);
        
    }
    @isTest
    private static void getRecipiesTest(){
        RestCalloutMock mock = new RestCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.getRecipies();
        System.assertEquals(response.getStatus(), 'OK');
        System.assertEquals(response.getStatusCode(), 200);
        
    }
    @isTest
    private static void getProductsTest(){
        RestCalloutMock mock = new RestCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.getProducts();
        System.assertEquals(response.getStatus(), 'OK');
        System.assertEquals(response.getStatusCode(), 200);
        
    } 
    @isTest
    private static void getBlogsTest(){
        RestCalloutMock mock = new RestCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.getBlogs();
        System.assertEquals(response.getStatus(), 'OK');
        System.assertEquals(response.getStatusCode(), 200);
        
    }
    @isTest
    private static void getUserTest(){
        RestCalloutMock mock = new RestCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.getUser();
        System.assertEquals(response.getStatus(), 'OK');
        System.assertEquals(response.getStatusCode(), 200);
        
    }
    @isTest
    private static void PostCalloutTest(){
        RestCalloutMock mock = new RestCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.PostCallout();
        System.assertEquals(response.getStatus(), 'OK');
        System.assertEquals(response.getStatusCode(), 201);
        
    }
    @isTest
    private static void postContactsTest(){
        RestCalloutMock mock = new RestCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.postContacts();
        System.assertEquals(response.getStatus(), 'OK');
        System.assertEquals(response.getStatusCode(), 201);
        
    }
}
