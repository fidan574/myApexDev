public with sharing class AccConAndOppOpperations {
    //Part 1 Question 1
    public static Decimal oppsSum(){     
        List<Opportunity> oppList = [select id, name, amount from opportunity where amount != null and stageName = 'Closed Won' ];
        decimal sum = 0;
        for (opportunity opp : oppList) {
            sum = sum + opp.amount;
        }
        System.debug('Sum   '+sum);
        return sum;
    }
    //Part 1 Question 2
    public static List<Account> accountsWithAtLeastOneOpp(String oppstageName){
        List<Account> accountsList = new List<Account>();
        accountsList = [Select Id, Name from Account Where Id In (Select AccountId from opportunity Where StageName = : oppstageName)];
        System.debug('accountsList  '+accountsList);
        return accountsList;
    }
    //PART 1 Question 3
    //Sol-A
    public static List<Account> accountsWithAtLeastOneContact(){
        //Get the account Ids from all the contacts in the org
        List<Contact> contactsList = new List<Contact>();
        contactsList = [Select AccountId from Contact];
        Set<Id> accntIdsSet = new Set<Id>();
        for(Contact con : contactsList){
            accntIdsSet.add(con.AccountId);
        }
        List<Account> accountsList = new List<Account>();
        accountsList = [Select Id, Name from Account WHere Id In : accntIdsSet];
        System.debug('accountsList  '+accountsList);
        return accountsList;
    }
    //Sol-B
    public static List<Account> accountsWithAtLeastOneContact1(){
        //Get the account Ids from all the contacts in the org
        List<Account> accountsList = new List<Account>();
        accountsList = [Select Id, Name from Account Where Id In (Select AccountId from Contact)];
        System.debug('accountsList  '+accountsList);
        return accountsList;
    }

    //3.1.Take account Id as input parameter and create a new contact for the provided account's Id. 
    //Populate Contact last name as same as Account's Name.
    public static contact createContact(Id accounId){
        Contact con;
        if(accounId != null){
            Account acc = [Select id, Name from Account where Id = :accounId];
            con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.id;
            //con.AccountId = accounId;
            Insert con;
        }
        return con;
    }

     //3.2.Update the description field of top 10 opportunities as "This is one of the top 10 opportunity. Please work on this properly".
    public static void updateTop10Opps(){
        List<Opportunity> top10OppsList = new List<Opportunity>([Select Id, Description from Opportunity where amount != null Order By Amount Desc Limit 10]);
        // Select Id, Description, Amount from Opportunity Order By Amount Desc nulls last Limit 10
        for(Opportunity opp : top10OppsList){
            opp.Description = 'This is one of the top 10 opportunity. Please work on this properly';
        } 
        Update top10OppsList;
    }

    //3.3.Write a logic to create and return n number of opportunities for a particular accountId.
    //AccountId and n will be passed as parameters in the method. 
    //Populate opportunity close date as 3 years from today,
    //Stage name as Prospecting 
    //Opportunity amount as Account's annual revenue divided by n and 
    //Opportunity name same as Account name.
    public static List<Opportunity> createNOpps(Integer n, Id accountId){
        List<Opportunity> oppsList = new List<Opportunity>();
        //List<Opportunity> oppsList; 
        if(n > 0){
            if(accountId != null){
                Account acc = [Select Name, AnnualRevenue, LastModifiedDate from Account where Id = :accountId];
                //oppsList = new List<Opportunity>();
                for(Integer i=1; i<=n; i++){
                    Opportunity opp = new Opportunity();
                    opp.Name = acc.Name + i;
                    opp.AccountId = accountId;
                    opp.CloseDate = Date.today().addYears(3);
                    opp.StageName = 'Prospecting';
                    if(acc.AnnualRevenue != null){//To avoid null pointer exception
                        opp.Amount = acc.AnnualRevenue/n;
                    }
                    oppsList.add(opp);
                }
            }
        } else {
            System.debug('Please tell us how many opportunities needs to be created');
        }
        if(!oppsList.isEmpty()){
            Insert oppsList;
            return oppsList;
        }
        return null;
        //return oppslist;
    }

    //3.4.Find out all the Account which have no contacts attached to them. Add a contact for each
    //one of them and update the last Name of contact with the Name field of account.
    public static void createContactsForAccounts(){
        List<Account> accList = new List<Account>([Select Id, Name from Account Where Id Not In (Select AccountId from Contact)]);
        List<Contact> contactListTobeCreated = new List<Contact>();
        for(Account acc : accList){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            contactListTobeCreated.add(con);
        }
        if(contactListTobeCreated.size()>0){
            Insert contactListTobeCreated;
        }
    }

    //3.5.Delete all the opportunities which have amount less than 20000 and status as closed
    //lost
        public static void deleteClosedLostOpps(){
            List<Opportunity> oppsList = new List<Opportunity>();
            oppsList = [Select Name from Opportunity where Amount < 20000 AND StageName = 'Closed Lost'];
            if(!oppsList.isEmpty()){
                Delete oppsList;
            }
            
        }
}

