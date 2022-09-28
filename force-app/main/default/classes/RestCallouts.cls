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
   
        public static HttpResponse getRecipies(){
            //1.prepare request
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://api.spoonacular.com/recipes/random?apiKey=33856f4dd2aa447997e50b85f8128a7b');
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
                CommonUtulityErrorLog.createLog('RestCallouts - getRecipies', 'Integration Apex', '', 'Error', 'Callout Exception', response.getStatus(), response.getBody());
            }
            return response;
        }
      
        public static HttpResponse getProducts(){
             // https://mockyard.herokuapp.com/products/1
         //1.prepare request
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://mockyard.herokuapp.com/products/1');
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
            List<ProductWrapper> productWrappers= (List<ProductWrapper>)JSON.deserialize(jsonString, List<ProductWrapper>.class);
            List<Product__c> products = new List<Product__c>();
            for(ProductWrapper pw : productWrappers){
                Product__c prod = new Product__c();
                prod.Name= pw.productId;
                prod.Category__c = pw.category;
                prod.Description__c = pw.description;
                String pr =  pw.price.substring(1);  //$23.01
                prod.Price__c = Decimal.valueOf(pr);
                prod.Image__c = pw.image;
                prod.Product_Name__c = pw.name;

                products.add(prod);
            }
            try {
                if(!products.isEmpty()){
                    insert products;
                }
            } catch (Exception ex) {
                  //Create a log records
                CommonUtulityErrorLog.createLog('RestCallouts - getProducts', 'Integration Apex', ex.getStackTraceString(), 'Exception', ex.getTypeName(), ex.getMessage(), '');
            }

        }
            return response;
        }
        public static HttpResponse getBlogs(){
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://mockyard.herokuapp.com/blogs/2');
            request.setMethod('GET');

            Http http = new Http();

            HttpResponse response = http.send(request);

            if(response.getStatusCode() == 200){
                //jsoString => wrappers => blog records
                String jsonString = response.getBody();
                system.debug(jsonString);
                
                List<BlogWrapper> blogWrappers = (List<BlogWrapper>)JSON.deserialize(jsonString, List<BlogWrapper>.class);
                List<Blog__c> blogs = new List<Blog__c>();
                for(BlogWrapper bw : blogWrappers){
                    Blog__c blog = new Blog__c();
                    blog.Topic__c = bw.topic;
                    blog.Author__c = bw.author;
                    blog.Body__c = bw.body;
                    blog.Title__c = bw.title;
                    blogs.add(blog); 
                }
              
                try {
                    if(!blogs.isEmpty()){
                        insert blogs;
                    }
                } catch (Exception ex) {
                      //Create a log records
                    CommonUtulityErrorLog.createLog('RestCallouts - getBlogs', 'Integration Apex', ex.getStackTraceString(), 'Exception', ex.getTypeName(), ex.getMessage(), '');
                }
    
            
            }
            return response;
        }
        public static HttpResponse getUser() {
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://mockyard.herokuapp.com/users/10');
            request.setMethod('GET');

            Http http = new Http();

            HttpResponse response = http.send(request);

            if(response.getStatusCode() == 200){
                String jsonString = response.getBody();
                System.debug(jsonString);
                List<UserWrapper> userWrappers= (List<UserWrapper>)JSON.deserialize(jsonString, List<UserWrapper>.class);

                List<User__c> users = new List<User__c>();
                for(UserWrapper uw : userWrappers){
                    User__c user = new User__c();
                    user.Name = uw.id;
                    user.Name__c = uw.name;
                    user.Email__c = uw.email;
                    user.Gender__c = uw.gender;
                    user.URL__c = uw.image;
                    user.Phone__c = uw.phone;
                    user.Country__c = uw.country;
                    user.City__c = uw.city;
                    user.Age__c = uw.age;
                    users.add(user);
                }

                try{  
                    if(!users.isEmpty()){
                        insert users;
                    }
                } catch (Exception ex) {
                    CommonUtulityErrorLog.createLog('RestCallouts - getUser', 'Integration Apex', ex.getStackTraceString(), 'Exception', ex.getTypeName(), ex.getMessage(), '');
                }
            }
            return response;
        }
        public static HttpResponse PostCallout() {
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
            request.setMethod('POST');
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');

            Map<String, Object> input = new Map<String, Object>();
            input.put('name','Cat');
            request.setBody(JSON.serialize(input));
            // string body = {"animal" : "Cat"}
            // request.setBody(body);

            Http http = new Http();

            HttpResponse response = http.send(request);

            if(response.getStatusCode() == 201){
                System.debug(response.getBody());
            }else {
                system.debug(response.getStatus());
            }
            return response;
        }
        public static HttpResponse postContacts() {
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://gorest.co.in/public/v2/users');
            request.setMethod('POST');

            List<Contact> contacts = [Select Name, Email, Gender__c, Status__c
                                    FROM Contact
                                    WHERE Gender__c != null
                                    AND Status__c != null LIMIT 1];

            ContactWrapper cw = new ContactWrapper();
            for(Contact con : contacts){
                
                cw.name= con.Name;
                cw.email = 'Test@testTestTest.com';
                cw.gender = con.Gender__c;
                cw.status = con.Status__c;
                
            }
            request.setBody(JSON.serialize(cw));

            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            request.setHeader('Authorization', 'Bearer 3707318278636e138f88a8e01a0ad5d1bdfa3073a7caea759f16db0d5095918a');

            Http http = new Http();

            HttpResponse response = http.send(request);

            if(response.getStatusCode() == 201){
                System.debug(response.getBody());
            
            
        }
        return response;
}}
