public with sharing class AccountUpdateHelper {
    @InvocableMethod
    public static void updateAccountWebsite(List<id> accIds) {
        list<account> listAcc = [select id, website from account where id in :accIds];
        for (account eachAcc : listAcc){
            eachAcc.website = 'www.softinovas.com';
        }
        update listAcc;
    }
}


