//Test REST CALLOUTS
RestCallouts.getAnimals();

RestCallouts.getUsers();
RestCallouts.getRecipies();
HttpResponse response =RestCallouts.getProducts();
System.debug(response);

RestCallouts.getBlogs();

HttpResponse resp =RestCallouts.getUser();
System.debug(resp);

HttpResponse resp =RestCallouts.PostCallout();
System.debug(resp);

HttpResponse resp =RestCallouts.postContacts();
System.debug(resp);

//test parks callouts
String[] parks = SoapCallouts.getParksByCountry('Germany');
System.debug(parks);

Double output = SoapCallouts.getSum(5, 3);
System.debug(output);

Double output1 = SoapCallouts.getSubstract(5, 3);
System.debug(output1);

Double output2 = SoapCallouts.getMultiply(5, 3);
System.debug(output2);

Double output3 = SoapCallouts.getdivide(5, 3);
System.debug(output3);

HttpResponse resp88 = CovidInfoRestCallout.getCovidInfo();
System.debug(resp88);

HttpResponse post = PostGorestCallout.postToPost();