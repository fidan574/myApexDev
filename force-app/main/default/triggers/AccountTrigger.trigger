trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    if(trigger.isBefore){
        AccountTriggerHandler.updateAccountDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    if (trigger.isAfter&&Trigger.isUpdate){
        AccountTriggerHandler.updateVIPForAllContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    // system.debug('====Trigger START====');
    // List<account> newAccounts = trigger.new; //is LIST<sObject>
    // if(trigger.isAfter && trigger.isInsert){
    //     system.debug('after trigger trigger.new = ' + newAccounts);
    //     system.debug('size of trigger.new = ' + newAccounts.size());

    //     for (account eachAcc : newAccounts) {
    //         system.debug('account id is ' + eachacc.id + ', each account name is ' + eachAcc.name);
    //     }

    // }
    // system.debug('====Trigger END====');
    /*
    system.debug('trigger.isBefore = ' + trigger.isBefore);
    system.debug('trigger.isAfter = ' + trigger.isAfter);
    system.debug('trigger.isInsert = ' + trigger.isInsert);
    system.debug('trigger.isUpdate = ' + trigger.isUpdate);
    //INSERT
    if (trigger.isAfter && trigger.isInsert) {
        system.debug('After Insert trigger called.');
    }
    if (trigger.isBefore && trigger.isInsert) {
        system.debug('Before Insert trigger called.');
    }

    //UPDATE
    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('After Update trigger called.');
    }
    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('Before Update trigger called.');
    }
    
    
    */
    /*
    //this should print only in BEFORE.
    if(Trigger.isBefore){
        system.debug('Before INSERT trigger called');
    }
    if(Trigger.isAfter){
        //this should print only in AFTER.
        system.debug('After INSERT trigger called');
    }

    */
}