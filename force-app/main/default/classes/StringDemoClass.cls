public class StringDemoClass {
    public void stringMethod1(){
        string sessionDescription = 'learning string method in apex language';

        system.debug('sessionDescription = ' + sessionDescription);
        //length of string
        integer lengthOfStr = sessionDescription.length();
        system.debug('length of string is ' + lengthOfStr);

        //convert to capital
        string sessionDescriptionInCaps = sessionDescription.toUpperCase();
        system.debug('in caps = ' + sessionDescriptionInCaps);

        //contains 'apex'
        boolean containsApex = sessionDescription.contains('apex');
        system.debug('contains apex? ' + containsApex );

        //contains 'salesforce'
        boolean containsSalesforce = sessionDescription.contains('salesforce');
        system.debug('contains salesforce? ' + containsSalesforce );

        //contains 'APEX'
        boolean containsApex21 = sessionDescription.contains('APEX');
        system.debug('contains APEX? ' + containsApex21 );


        //contains Ignore Case 'APEX'
        boolean containsApex2 = sessionDescription.containsIgnoreCase('APEX');
        system.debug('contains APEX? ' + containsApex2 );

        



    } 
}
