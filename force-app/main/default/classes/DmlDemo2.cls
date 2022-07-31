public class DmlDemo2 {
    public static void dmlUpdateDemo_3() {
        //1. fetch record
        account acc = [select id, name, Site from account where name like 'Soft%' limit 1];
        //2. update account
        acc.Name = 'SoftInnovas Inc';
        acc.site = 'www.softinnovas.com';
 
        //3. update DML
        update acc;
        system.debug('acc = ' + acc);
    }
 
    public static void dmlInsertRelatedDemo_1() {
        //1. fetch account record
        account acc = [select id, name from account where name = 'SoftInnovas Inc' limit 1];
 
        //2. create contact's instance
        Contact c = new Contact();
        c.LastName = 'Biden';
        c.AccountId = acc.Id;
        insert c;
    }
    public static void dmlInsertRelatedDemo_2(){
        salesforce_Project__c sp = [select id, name from Salesforce_Project__c order by CreatedDate DESC limit 1];
    Salesforce_Ticket__c st = new Salesforce_Ticket__c();
    st.Subject__c = 'Learn DML in APEX';
    st.Status__c = 'New';
    st.Requested_by_date__c = date.newInstance(2022, 7, 29);
    st.Salesforce_Project__c = sp.id;

    insert st;
    system.debug('st = ' + st);

    }
    public static void dmlInsertRelatedDemo_right1(){
        List<Account> listAcc = new List<Account>();
        account a1 = new Account();
        a1.Name = 'Bulk acc 1';
        listAcc.add(a1);

        account a2 = new Account();
        a2.Name = 'Bulk acc 2';
        listAcc.add(a2);

        account a3 = new Account();
        a3.Name = 'Bulk acc 3';
        listAcc.add(a3);

        account a4 = new Account();
        a4.Name = 'Bulk acc 4';
        listAcc.add(a4);

        insert listAcc;
    }
    public static void dmlInsertRelatedDemo_4(){
        List<Account> listAccount = new List<Account>();

        for (integer  i=0; i<200; i++){
            Account acc = new account();
            acc.Name = 'SoftInnovas 29 July v'+i;
            acc.AccountNumber = 'Accis-'+i;
            acc.Active__c = 'Yes';
            listAccount.add(acc);

            system.debug('Size of list = ' + listAccount.size());
        }
        if(!listAccount.isEmpty()){
            insert listAccount;
        }
}

 }