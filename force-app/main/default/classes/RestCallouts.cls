public with sharing class RestCallouts {
    public static HttpResponse getAnimals(){
        //1.prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET'); 

        //2.prepate http
        Http http = new Http();

        //3.send the request over the internet and receive response
        HttpResponse response = http.send(request);

        //4. process the response
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            System.debug(jsonString);
        } else {
            //Create a log records
            CommonUtulityErrorLog.createLog('RestCallouts - getAnimals', 'Integration Apex', '', 'Error', 'Callout Exception', response.getStatus(), response.getBody());
        }
        return response;
    }
    public static HttpResponse getUsers() {
         //1.prepare request
        //https://gorest.co.in/public/v2/users
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        request.setMethod('GET');

        //2.prepate http
        Http http = new Http();
        
        //3.send the request over the internet and receive response
        HttpResponse response = http.send(request);

        //4. process the response
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            System.debug(jsonString);
            List<ContactResponse> contactResponses =( List<ContactResponse>)JSON.deserialize(jsonString, List<ContactResponse>.class );
            processContacts(contactResponses);
        } else {
            //Create a log records
            CommonUtulityErrorLog.createLog('RestCallouts - getUsers', 'Integration Apex', '', 'Error', 'Callout Exception', response.getStatus(), response.getBody());
        }
        return response;

    }

    private static void processContacts( List<ContactResponse> contactResponses){
        List<Contact> contacts = new List<Contact>();
        for(ContactResponse conRes : contactResponses){
            Contact con = new Contact();
            String[] names = conRes.name.split(' ');
            con.FirstName = names[0];
            con.LastName = names[1];
            con.Email = conRes.email;
            con.Gender__c = conRes.gender;
            con.Status__c = conRes.status;
            contacts.add(con);
        }
        insert contacts;
    }
}
