public class ContactTriggerHandler {
    public static void contactUpdateValidatio1(List<contact> conTriggerNew, 
                                                Map<id, contact>conTriggerNewMap, 
                                                List<contact> conTriggerOld, 
                                                Map<id, contact> conTriggerOldMap ) {
        for(contact eachcon : conTriggerNew){
            contact oldCon = conTriggerOldMap.get(eachcon.id);
            //oldcontact --> older value of LeadSurce.Will not allove to change the lad source if the old source is parter referral
            if(oldcon.LeadSource == 'Partner Referral'){
                eachcon.addError('Cannot update Partner Referral contact');
            }
        }
    }
    public static void contactUpdateValidatio2(List<contact> conTriggerNew, 
                                                Map<id, contact>conTriggerNewMap, 
                                                List<contact> conTriggerOld, 
                                                Map<id, contact> conTriggerOldMap ) {
        for(contact eachcon : conTriggerNew){
            contact oldCon = conTriggerOldMap.get(eachcon.id);
            //oldcontact --> older value of LeadSurce.Will not allove to change the lad source if the old source is parter referral
            if(eachcon.LeadSource != oldCon.LeadSource ){
                string  customErrorMsg = System.Label.ContactValidation2;
                eachcon.leadsource.addError(customErrorMsg);
            }
        }
    }
}
