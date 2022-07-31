public class DmlInsertDemo {
    public static void dmlInsertDemo_stndObj() {
        Account acc = new account();
        acc.Name = 'Softinnovas';

        insert acc;
        system.debug(acc);
    }
    public static void dmlInsertDemo_cstmObj(){
        Salesforce_project__c sp = new Salesforce_project__c();
        sp.Project_Name__c = 'Teach DML to falcons';
        sp.description__c = 'All 40% are great learners';
        insert sp;
        system.debug(sp);
    }
}
