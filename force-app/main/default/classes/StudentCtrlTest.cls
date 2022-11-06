@isTest
public with sharing class StudentCtrlTest {
    @TestSetup
    static void makeData(){
        List<Student__c> listStu = new list<Student__c>();
        // Student__c s = new Student__c();
        // s.Student_Name__c = 'Zeynep';
        // s.Class__c = 5;
        // s.Mobile__c = '12345';
        // s.Email__c = 'test@gmail.com';
        // s.Postal_Code__c = '123';
        // listStu.add(s);
        // insert listStu;
        for(Integer i = 0; i < 3; i++){
            Student__c s = new Student__c();
            s.Student_Name__c = 'Student' + i;
            s.Class__c = 5;
            s.Mobile__c = '454554';
            s.Email__c = 'i@test.com';
            s.Postal_Code__c = '123' + i;
            listStu.add(s);
        }
        insert listStu;
    }

    @isTest
    private static void StudentCtrlTest1(){
        StudentCtrl.searchStudentByPostalCode('23');
        
        
    }
}
