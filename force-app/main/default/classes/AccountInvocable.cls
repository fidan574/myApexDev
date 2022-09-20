public with sharing class AccountInvocable {
    @InvocableMethod(label = 'Close Related Opportunities' 
    description = 'Close all the related opportunities of the given accounts' 
    category = 'Account')
    public static void closeOpportunities(List<Id> accountIds){
        //get all the open related oppoetunities
        List<Opportunity> opps = [SELECT Id, StageName 
        FROM Opportunity 
        WHERE AccountId IN :accountIds 
        AND StageName NOT IN ('Closed Won', 'Closed Lost')];
        
        //iterate over the records and populate stage name
        for (Opportunity opp : opps) {
            opp.StageName = 'Closed Lost';
        }
        //hit update
        try {
            update opps;
        } catch (Exception ex) {
            system.debug(ex.getMessage());
        }
    }
}
