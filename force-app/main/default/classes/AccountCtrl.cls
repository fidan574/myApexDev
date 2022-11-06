public with sharing class AccountCtrl {
    @AuraEnabled(cacheable=true)
    public static List<Account> getTopAccounts() {
        return [SELECT Name, Type, Industry, AnnualRevenue
            FROM Account
            WHERE AnnualRevenue != Null
            WITH SECURITY_ENFORCED
            ORDER BY AnnualRevenue DESC
            LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountByIndustry(String industry){
        return [SELECT Name, Type, Industry, AnnualRevenue
            FROM Account
            WHERE Industry = :industry
            WITH SECURITY_ENFORCED
            LIMIT 10];
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountByIndustryImperative(String industry){
        return [SELECT Name, Type, Industry, AnnualRevenue
            FROM Account
            WHERE Industry = :industry
            WITH SECURITY_ENFORCED
            ];
    }
}
