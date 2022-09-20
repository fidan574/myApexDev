//Get an opportunity record whose amount is greater than 1M
//Convert that into json and debug it
Opportunity opp = [SELECT Name, Amount,StageName, Type FROM Opportunity WHERE Amount > 1000000 LIMIT 1];
String jsonString = JSON.serialize(opp);
system.debug(jsonString);

//Get a lead record whose email and phone are populated
//convert that record into json format and print it using debug
Lead ld = [SELECT Name, Email, Phone, Company FROM Lead WHERE Email != Null and Phone!= Null LIMIT 1];
String jsonStr = JSON.serialize(ld);
system.debug(jsonStr);

List<Lead> leads = [SELECT FirstName, LastName, Email, Company,Title FROM Lead WHERE Email!=Null and Company!= Null ];
string jsonString = JSON.serialize(leads);
System.debug(jsonString);

List<Opportunity> opps = [SELECT Name, Amount,StageName, Type FROM Opportunity WHERE StageName = 'Closed Won'];
String jsonString = JSON.serialize(opps);
system.debug(jsonString);

//get 2 cases (CaseNumber, Subject, Description, Contact.FirstName, Contact.LastName, Account.Name) where subject is not null
//convert them into json format
list<Case> cases = [SELECT CaseNumber, Subject, Description, Contact.FirstName, Contact.LastName, Account.Name 
                    FROM Case 
                    Where Subject != Null 
                    LIMIT 2];
String jsonString = JSON.serialize(cases);
system.debug(jsonString);

