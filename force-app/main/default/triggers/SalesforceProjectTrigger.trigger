trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert) {   
    if(trigger.isAfter && trigger.isInsert){
        SalesforceProjectTriggerHandler.createDefaultSalesforceTicket(Trigger.New);
    }
} 