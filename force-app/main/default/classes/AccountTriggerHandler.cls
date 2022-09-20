public class AccountTriggerHandler {
    public static void updateAccountDescription(List<account> accTriggerNew,
                                                List<account> accTriggerOld,
                                                Map<id, account> accTriggerNewMap,
                                                Map<id, account> accTriggerOldMap ) {
        
        for(account eachacc : accTriggerNew) {
            boolean updateDesc = false;

            if(accTriggerOldMap == null && eachacc.Active__c == 'Yes'){
                updateDesc = true;
            }

            if(accTriggerOldMap != null){
                if(eachacc.Active__c == 'Yes' && eachacc.Active__c != accTriggerOldMap.get(eachacc.id).Active__c){
                    updateDesc = true;
                }
            }

            if(updateDesc){
                eachacc.Description = 'Account is now active. Enjoy!';
                
            }
        }   

    }
    public static void updateVIPForAllContacts(List<account> accTriggerNew,
                                                List<account> accTriggerOld,
                                                Map<id, account> accTriggerNewMap,
                                                Map<id, account> accTriggerOldMap ) {
        set<id > setAccIds = new set<id>();
        for (account eachAcc : accTriggerNew) {
            account oldAccount = accTriggerOldMap.get(eachAcc.id);
            if(eachAcc.vip__c != oldAccount.vip__c){
                setAccIds.add(eachAcc.id);
            }
        } 
        if(!setAccIds.isEmpty()) {
        List<Contact> listContacts = [select id, name, vip__c, accountid from contact where accountid in :   setAccIds]; 
            for(contact eachContact : listContacts) {
                account newAccountRecord = accTriggerNewMap.get(eachContact.AccountId);
                eachContact.VIP__c = newAccountRecord.VIP__c;
            } 
            update listContacts;
        }     

                                
    }                                               
        
}
