public with sharing class RestCalloutMock implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest request) {
        if(request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/animals' && request.getMethod() == 'GET') {
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
            response.setStatus('OK');
            return response;
        } else if(request.getEndpoint() == 'https://gorest.co.in/public/v2/users' && request.getMethod() == 'GET' ){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('[{"id":3800,"name":"Gemini Mishra","email":"mishra_gemini@witting.org","gender":"male","status":"active"}]');
            response.setStatus('OK');
            return response;
        } else if(request.getEndpoint() == 'https://api.spoonacular.com/recipes/random?apiKey=33856f4dd2aa447997e50b85f8128a7b' && request.getMethod() == 'GET' ){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('{"status":"failure", "code":401,"message":"You are not authorized. Please read https://spoonacular.com/food-api/docs#Authentication"}');
            response.setStatus('OK');
            return response;
        } else if(request.getEndpoint() == 'https://mockyard.herokuapp.com/products/1' && request.getMethod() == 'GET' ){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('[{"id":1,"name":"Pepper - Chilli Seeds Mild","price":"$260.82","description":"sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo","category":"Groceries","createdAt":"30-03-2021","productId":52434932138}]');
            response.setStatus('OK');
            return response;
        } else if(request.getEndpoint() == 'https://mockyard.herokuapp.com/blogs/2' && request.getMethod() == 'GET' ){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('[{"id":2,"topic":"business","title":"Are Customers Experiencing Eco Fatigue? Meet The B-Corp Wanting To Make A Difference","author":"Kate Hardcastle","body":"As consumers continue to navigate their way through a myriad of products with green claims, more products seem to be filling supermarket shelves everyday. It is now 7 months since COP26 in Glasgow when bold claims were made as companies pledged action to make a difference. The pressure from consumers is increasing as rightly, they are demanding environmentally responsible products from organisations that have sustainability at heart."}]');
            response.setStatus('OK');
            return response;
        } else if(request.getEndpoint() == 'https://mockyard.herokuapp.com/users/10'&& request.getMethod() == 'GET' ){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('[{"id":1,"name":"Hasty Skinn","email":"hskinn0@addtoany.com","gender":"Male","image":"https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80","phone":"708-484-6550","country":"Albania","city":"Krahës","age":41}]');
            response.setStatus('OK');
            return response;
        }else if(request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/animals' && request.getMethod() == 'POST' ){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(201);
            response.setBody('[{"id":3750,"name":"Mandakini Mishra JD","email":"mishra_jd_mandakini@lemke.name","gender":"male","status":"inactive"}]');
            response.setStatus('OK');
            return response;
        } else if(request.getEndpoint() == 'https://gorest.co.in/public/v2/users' && request.getMethod() == 'POST' ){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(201);
            response.setBody('[{"id":3800,"name":"Gemini Mishra","email":"mishra_gemini@witting.org","gender":"male","status":"active"}]');
            response.setStatus('OK');
            return response;
        }
        return null;
    }
}
