@RestResource(urlMapping = '/Contact/*')
Global with sharing class ContactManager {
    @HttpGet
    Global static Contact getContact(){
        /* https://bluemarbletravel-dev-ed.lightning.force.com/services/apexrest/Contact/5007Q00000DfntoQAB*/
        RestRequest request = RestContext.request;
        String requestUrl = request.requestURI;
        Integer lastIndex = requestUrl.lastIndexOf('/');
        Id contactId = requestUrl.substring(lastIndex + 1);
    
        // String[] urlList= requestUrl.split('/');
        // Id caseId = urlList[urlList.size()-1];
        Contact con = [SELECT FirstName, LastName, Title, Email, Department FROM Contact WHERE Id = :contactId LIMIT 1];
        return con;
        /* FirstName: Dhananjay
        LastName: Sharma
        Email: sharma_dhananjay@denesik-parisian.net
        Id: 0037Q00000MdQG1QAN*/
    }

    @HttpPost
    Global Static Id createContact(String firstname, String lastname, String title, String email, String department){
        Contact con = new Contact();
        con.FirstName = firstname;
        con.LastName = lastname;
        con.Title = title;
        con.Email = email;
        con.Department = department;
        insert con;
        return con.Id;
    }

    /* https://bluemarbletravel-dev-ed.lightning.force.com/services/apexrest/Contact/{caseId}*/
    @HttpDelete
    Global Static String deleteContact(){
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        Integer lastIndex = uri.lastIndexOf('/');
        Id contactId = uri.substring(lastIndex+1);
        Contact con = [SELECT Id FROM Contact WHERE Id = :contactId LIMIT 1];
        delete con;
        return 'Contact has been deleted successfully!';

    }
    @HttpPut
    Global Static Id upsertContact(String id, String firstname, String lastname, String title, String email, String department){
        Contact con = new Contact();
        con.Id = id;
        con.FirstName = firstname;
        con.LastName = lastname;
        con.Title = title;
        con.Email = email;
        con.Department = department;
        upsert con;
        return con.Id;
    }

    @HttpPatch
    Global Static Contact updateContact() {
        RestRequest request = RestContext.request;
        String jsonString = request.requestBody.toString();
        Map<String, Object> contactInfo = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
        System.debug(contactInfo);
        Contact con = new Contact();
        for(String key: contactInfo.keySet()){
            if(key != 'attributes'){  //attribute is not our key but it comes automatically. So it gives error on test that is the reson of this code
                con.put(key, contactInfo.get(key));
            }
        }
        update con;
        return con;

    }
}
