public with sharing class OpportunityCtrl {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getTopOpps() {
        return [SELECT Name, Type, StageName, Amount
            FROM Opportunity
            WHERE Amount != Null
            WITH SECURITY_ENFORCED
            ORDER BY Amount DESC
            LIMIT 10];
    }
    //UC1:
    //Get top 10 opportunities based on the amounts and display the same in descending order of their amount.
    //The lightning data table should display the following opportunity fields
    //Name, Type, StageName, Amount

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppByStageName(String stageName){
        return [SELECT Name, Type, StageName, Amount
            FROM Opportunity
            WHERE StageName = :stageName
            WITH SECURITY_ENFORCED
            LIMIT 10];
    }
    //UC2:
    //Get the opportunities based on the given stagename and display the same in a lightning data table.
    //The lightning data table should display the following opportunity fields
    //Name, Type, StageName, Amount
}
