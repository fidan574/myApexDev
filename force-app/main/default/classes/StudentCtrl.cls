public with sharing class StudentCtrl {
    @AuraEnabled
    public static List<Student__c> searchStudentByPostalCode(String searchKey) {
        searchKey = '%' + searchKey + '%';

        return [SELECT Student_Name__c, Class__c,Mobile__c, Email__c, Postal_Code__c
                FROM Student__c
                WHERE Postal_Code__c LIKE :searchKey  //we can use like WHERE Name LIKE : searchKey
                WITH SECURITY_ENFORCED];
        }
    
}
