public class SalesforceProjectTriggerHandler {
    try{
    public static void createDefaultSalesforceTicket(List<Salesforce_Project__c> spTriggerNew) {
        List<Salesforce_Ticket__c> newSTList = new List<Salesforce_Ticket__c>();
        DefaultTicketInfo__c ticketInfo = DefaultTicketInfo__c.getOrgDefaults(); 
        for (Salesforce_Project__c eachSP : spTriggerNew){
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c = ticketInfo.Subject__c;
            st.Description__c = ticketInfo.Description__c;
            st.Salesforce_Project__c = eachSP.id;
            newSTList.add(st);

        }
        if(!newSTList.isEmpty()){
            insert newSTList;
        }
    }catch(exception ex){
        system.debug('There is error. Fix');
        for(Salesforce_Project__c eachSP :spTriggerNew){
            eachSP.addError('Salesforce Ticket creat ')
        }
    }
    }
}
