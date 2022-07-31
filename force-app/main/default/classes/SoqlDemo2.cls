public class SoqlDemo2 {
    public static void childToParent_Soql1() {
        List<Contact> listCnt = [select id, name, account.industry from contact where account.industry = 'Energy'];
       
        for (Contact eachContact :listCnt){
            string accName = eachContact.Account.Name;
            system.debug('contact name is ' + eachContact.Name + 'its acc is ' + accName);
        }

        
    }
}



// select id, name, priority__c, subject__c, salesforce_project__r.project_name__c, salesforce_project__r.status__c from salesforce_ticket__c