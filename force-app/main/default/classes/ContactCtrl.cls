public with sharing class ContactCtrl {
    //we do not use catche true because vwe need refresh data
    @AuraEnabled
    public static List<Contact> searchContacts(String searchKey) {
        searchKey = '%' + searchKey + '%';
        return [SELECT Name, Title, Email, Phone
                FROM Contact
                WHERE FirstName LIKE :searchKey  //we can use like WHERE Name LIKE : searchKey
                OR LastName LIKE :searchKey
                WITH SECURITY_ENFORCED];
    }
}
