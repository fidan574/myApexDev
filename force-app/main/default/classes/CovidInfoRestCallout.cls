public with sharing class CovidInfoRestCallout {
    public static HttpResponse getCovidInfo(){
        //1.prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.covidtracking.com/v1/us/current.json');
        request.setMethod('GET'); 

        //2.prepate http
        Http http = new Http();

        //3.send the request over the internet and receive response
        HttpResponse response = http.send(request);

        //4.Process the HttpResponse
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            System.debug(jsonString);
            //Convert the Json string into our product object
            List<CovidInfoWrapper> covidInfoWrapper = (List<CovidInfoWrapper>)JSON.deserialize(jsonString, List<CovidInfoWrapper>.class);
        List<Covid_Info__c> covIn = [SELECT id, Received_Date__c FROM Covid_Info__c WHERE Received_Date__c = today];
            Covid_Info__c ci = new Covid_Info__c();
            ci.Name = String.valueOf(covidInfoWrapper[0].states);
            ci.Positive__c = covidInfoWrapper[0].positive;
            ci.Negative__c = covidInfoWrapper[0].negative;
            ci.Pending__c = covidInfoWrapper[0].pending;
            if(!covIn.isEmpty()){ 
                ci.id=covIn[0].id;   
                update ci;
            } else {
                ci.Received_Date__c = date.today();
                insert ci;
            }
        }
        return response;
    }
}