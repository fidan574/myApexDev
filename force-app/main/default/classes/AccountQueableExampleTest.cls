public class AccountQueableExampleTest {
    @isTest 
    public static void testQueueable(){
        list<account> listAcc = new list<account>();
        for(integer i =0; i<500; i++){
            account a3 = new account();
            a3.name = 'PI Test';
            a3.Industry = 'Banking';
            a3.Type = 'Customer - Direct';
            listAcc.add(a3);
        }
        insert listAcc;

        Test.startTest();
        AccountQueableExample aq = new AccountQueableExample(listAcc);
        ID jobId = system.enqueueJob(aq);
        Test.stopTest();

    }
}
