@RestResource(urlMapping = '/Account/*')
Global with sharing class AccountManager {
    @HttpGet
    Global static Account getAccount(){
        /* https://bluemarbletravel-dev-ed.lightning.force.com/services/apexrest/Account/0017Q00000TryPIQAZ*/
        RestRequest request = RestContext.request;
        String requestUrl = request.requestURI;
        Integer lastIndex = requestUrl.lastIndexOf('/');
        Id accountId = requestUrl.substring(lastIndex + 1);
    
        // String[] urlList= requestUrl.split('/');
        // Id caseId = urlList[urlList.size()-1];
        Account acc = [SELECT Industry, AnnualRevenue, CustomerPriority__c, Type, Description FROM Account WHERE Id = :accountId LIMIT 1];
        return acc;
    }

    @HttpPost
    Global Static Id createdCase(String accountname, String industry, decimal annualrevenue, String customerpriority, String description){
        Account acc = new Account();
        acc.Name = accountname;
        acc.Industry = industry;
        acc.AnnualRevenue = annualrevenue;
        acc.CustomerPriority__c = customerpriority;
        acc.Description = description;
        insert acc;
        return acc.Id;
    }

    /* https://bluemarbletravel-dev-ed.lightning.force.com/services/apexrest/Case/{caseId}*/
    @HttpDelete
    Global Static String deleteAccount(){
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        Integer lastIndex = uri.lastIndexOf('/');
        Id accountId = uri.substring(lastIndex+1);
        Account acc = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
        delete acc;
        return 'Account has been deleted successfully';

    }
    @HttpPut
    Global Static Id upsertAccount(String id, String accountname, String industry, decimal annualrevenue, String description){
        Account acc = new Account();
        acc.Id = id;
        acc.Name = accountname;
        acc.Industry = industry;
        acc.AnnualRevenue = annualrevenue;
        acc.Description = description;
        upsert acc;
        return acc.Id;
    }

    @HttpPatch
    Global Static Account updateAccount() {
        RestRequest request = RestContext.request;
        String jsonString = request.requestBody.toString();
        Map<String, Object> accountInfo = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
        System.debug(accountInfo);
        Account acc = new Account();
        for(String key: accountInfo.keySet()){
            acc.put(key, accountInfo.get(key)); 
        }
        update acc;
        return acc;

    }
}

