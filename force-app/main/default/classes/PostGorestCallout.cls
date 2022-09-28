public with sharing class PostGorestCallout {
    public static HttpResponse postToPost() {
        //1. Prepare HttpRequest & wrap the necessary information in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/posts');
        request.setMethod('POST');
        //1.1 Get data and prepare it as JSON
        List<Posts__c> pst = [SELECT Name, User_ID__c, Title__c, Body__c
                                    FROM Posts__c
                                    LIMIT 1];
        postWrapper post = new postWrapper();
            String id =  pst[0].Name.substring(4);  
            post.id= Integer.valueOf(id);
            post.user_id = integer.valueOf(pst[0].User_ID__c);
            post.title   = pst[0].Title__c;
            post.body    = pst[0].Body__c;
        request.setBody(JSON.serialize(post));
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer 3707318278636e138f88a8e01a0ad5d1bdfa3073a7caea759f16db0d5095918a');
        //2. Prepare internet
        Http http = new Http();
        //3. Send the HttpRequest over the internet to receive HttpResponse back
        HttpResponse response = http.send(request);
        System.debug(response.getBody());
        //4. Process the HttpResponse
        return response;
    }
    public class postWrapper{
        public integer id;
        public integer user_id;
        public string title;
        public string body;
    }
}

