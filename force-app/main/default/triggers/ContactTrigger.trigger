trigger ContactTrigger on Contact (before insert,  after insert, before update, after update) {
    if(trigger.isBefore && trigger.isUpdate){
        ContactTriggerHandler.contactUpdateValidatio1(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
        ContactTriggerHandler.contactUpdateValidatio2(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
         //Soru : Yeni bir Contact create edilip bir Accounta bağlandığında, Accounta bağlı bir Contact delete edildiğinde veya Bir Contact update edilerek bir Account ile bağlantısı kesilirse, bir Accounta bağlanırsa ya da bağlantı değişirse Accountta Number_of_Contacts__c fieldi güncellenecek..

    // Etkilenen Accountların id lerini toplayacağım bir şiste oluşturuyorum..
    set<id> accIds = new Set<Id>();

    if (trigger.isAfter) {
        if (trigger.isInsert || trigger.isUndelete) {
            for (contact cn : trigger.new) {
                if (cn.accountId != null) {
                    accIds.add(cn.accountId);
                }
            }
        }

        if (trigger.isUpdate) {
            for (contact cn : trigger.new) {
                if (cn.accountId != trigger.oldmap.get(cn.id).accountId) {
                    accIds.add(cn.accountId);
                    accIds.add(trigger.oldmap.get(cn.id).accountId);
                }
            }
        }

        if (trigger.isDelete) {
            for (contact cn : trigger.old) {
                if (cn.AccountId != null) {
                    accIds.add(cn.AccountId);
                }
            }
        }

        if (!accIds.isEmpty()) {
            List<Account> accList = [ select id, name, 	Number_Of_Contacts__c, (select id from contacts) from Account where id in : accIds ];
            for (Account acc : accList) {
                acc.Number_Of_Contacts__c = acc.contacts.size();
            }
            update accList;
        }
    }
    }




    trigger ContactTrigger on Contact (before insert, after insert, before update, after update, after delete, after undelete) {
    //Soru : Yeni bir Contact create edilip bir Accounta bağlandığında, Accounta bağlı bir Contact delete edildiğinde veya Bir Contact update edilerek bir Account ile bağlantısı kesilirse, bir Accounta bağlanırsa ya da bağlantı değişirse Accountta Number_of_Contacts__c fieldi güncellenecek..

    // Etkilenen Accountların id lerini toplayacağım bir şiste oluşturuyorum..
    set<id> accIds = new Set<Id>();

    if (trigger.isAfter) {
        if (trigger.isInsert || trigger.isUndelete) {
            for (contact cn : trigger.new) {
                if (cn.accountId != null) {
                    accIds.add(cn.accountId);
                }
            }
        }

        if (trigger.isUpdate) {
            for (contact cn : trigger.new) {
                if (cn.accountId != trigger.oldmap.get(cn.id).accountId) {
                    accIds.add(cn.accountId);
                    accIds.add(trigger.oldmap.get(cn.id).accountId);
                }
            }
        }

        if (trigger.isDelete) {
            for (contact cn : trigger.old) {
                if (cn.AccountId != null) {
                    accIds.add(cn.AccountId);
                }
            }
        }

        if (!accIds.isEmpty()) {
            List<Account> accList = [ select id, name, 	Number_Of_Contacts__c, (select id from contacts) from Account where id in : accIds ];
            for (Account acc : accList) {
                acc.Number_Of_Contacts__c = acc.contacts.size();
            }
            update accList;
        }
    }

    // if(Trigger.isBefore){
    //     system.debug('BEFORE Trigger');
    //     if(trigger.isInsert){
    //         system.debug('BEFORE INSERT Trigger');
    //     }
    //     if(trigger.isUpdate){
    //         system.debug('BEFORE UPDATE Trigger');
    //     }
    // }
    // if(Trigger.isAfter){
    //     system.debug('AFTER Trigger');
    //     if(trigger.isInsert){
    //         system.debug('AFTER INSERT Trigger');
    //     }
    //     if(trigger.isUpdate){
    //         system.debug('AFTER UPDATE Trigger');
    //     }
    // }
}