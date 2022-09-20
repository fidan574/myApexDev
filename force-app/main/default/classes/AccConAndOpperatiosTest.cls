@isTest
public class AccConAndOpperatiosTest {
    @TestSetup
    static void makeData(){
        Account acc1 = new Account();
        acc1.name = 'Test 1';
        acc1.AnnualRevenue = 10000;

        Account acc2 = new Account();
        acc1.name = 'Test 2';
        acc1.AnnualRevenue = 20000;

        Account acc3 = new Account();
        acc1.name = 'Test 3';
        acc1.AnnualRevenue = 30000;

        List<account> listAcc = new List<account>{acc1, acc2, acc3};
        insert listAcc;

        List<Opportunity> listOpp = new List<Opportunity>();
        for(integer i = 1; i<= 10; i++){
            Opportunity op = new Opportunity();
            op.name = 'Test1 opp' + i;
            op.Amount = 5000*i;
            op.StageName = 'Closed Won';
            op.description = 'Demo';
            op.CloseDate = date.today().addDays(45);
            op.AccountId = listAcc[0].id;
            listOpp.add(op);

        }

       
        for(integer i = 11; i<= 20; i++){
            Opportunity op = new Opportunity();
            op.name = 'Test2 opp' + i;
            op.Amount = 5000*i;
            op.StageName = 'Closed Lost';
            op.description = 'Demo';
            op.CloseDate = date.today().addDays(55);
            op.AccountId = listAcc[1].id;
            listOpp.add(op);

        }

        for(integer i = 21; i<= 30; i++){
            Opportunity op = new Opportunity();
            op.name = 'Test3 opp' + i;
            op.Amount = 5000*i;
            op.StageName = 'Prospecting';
            op.description = 'Demo';
            op.CloseDate = date.today().addDays(65);
            op.AccountId = listAcc[2].id;
            listOpp.add(op);

        }
        insert listOpp;
        List<contact> listCon = new List<contact>();
        for (integer i=1; i<=10; i++) {
            contact c = new Contact();
            c.LastName = 'Test Contact' + i;
            c.AccountId = listAcc[0].id;
            listCon.add(c);
        }
        
        for (integer i=11; i<=20; i++) {
            contact c = new Contact();
            c.LastName = 'Test2 Contact' + i;
            c.AccountId = listAcc[1].id;
            listCon.add(c);
        }
        for (integer i=21; i<=30; i++) {
            contact c = new Contact();
            c.LastName = 'Test3 Contact' + i;
            c.AccountId = listAcc[2].id;
            listCon.add(c);
        }
        insert listCon;

        

    }  
    @isTest
        private static void oppsSumTest() {
            decimal toplam = AccConAndOppOpperations.oppsSum(); 
            List<Opportunity> oppList = [select id, name, amount from opportunity where amount != null and StageName = 'Closed Won' ];
            decimal sum = 0;
            for (opportunity op : oppList) {
                sum += op.amount; 
            }
            system.assertEquals(sum, toplam);
        }
        @isTest
        private static void accountsWithAtLeastOneContact1() {
            List<account> accList = AccConAndOppOpperations.accountsWithAtLeastOneOpp('Closed Lost');
            system.debug(accList);
            system.assertEquals('Test 2', accList[0].name);
        }
}

