@RestResource(urlMapping = '/Case/*')
Global with sharing class CaseManager {
    @HttpGet
    Global static Case getCase(){
        /* https://bluemarbletravel-dev-ed.lightning.force.com/services/apexrest/Case/5007Q00000DfntoQAB*/
        RestRequest request = RestContext.request;
        String requestUrl = request.requestURI;
        Integer lastIndex = requestUrl.lastIndexOf('/');
        Id caseId = requestUrl.substring(lastIndex + 1);
    
        // String[] urlList= requestUrl.split('/');
        // Id caseId = urlList[urlList.size()-1];
        Case cs = [SELECT CaseNumber, Subject, Priority, Origin, Description FROM Case WHERE Id = :caseId LIMIT 1];
        return cs;
    }

    @HttpPost
    Global Static Id createCase(String subject, String priority, String origin, String description){
        Case cs = new Case();
        cs.Subject = subject;
        cs.Priority = priority;
        cs.Origin = origin;
        cs.Description = description;
        insert cs;
        return cs.Id;
    }

    /* https://bluemarbletravel-dev-ed.lightning.force.com/services/apexrest/Case/{caseId}*/
    @HttpDelete
    Global Static String deleteCase(){
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        Integer lastIndex = uri.lastIndexOf('/');
        Id caseId = uri.substring(lastIndex+1);
        Case cs = [SELECT Id FROM Case WHERE Id = :caseId LIMIT 1];
        delete cs;
        return 'Case has been deleted successfully';

    }
    @HttpPut
    Global Static Id upsertCase(String id, String subject, String priority, String origin, String description){
        Case cs = new Case();
        cs.Id = id;
        cs.Subject = subject;     //cs.put('Subject', subject);
        cs.Priority = priority;
        cs.Origin = origin;
        cs.Description = description;
        upsert cs;
        return cs.Id;
    }

    @HttpPatch
    Global Static Case updateCase() {
        RestRequest request = RestContext.request;
        String jsonString = request.requestBody.toString();
        Map<String, Object> caseInfo = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
        System.debug(caseInfo);
        Case cs = new Case();
        for(String key: caseInfo.keySet()){
            if(key != 'attributes'){  //attribute is not our key but it comes automatically. So it gives error on test that is the reson of this code
                cs.put(key, caseInfo.get(key));
            }
        }
        update cs;
        return cs;

    }
}

/* https://falcons8-dev-ed.my.salesforce.com/services/apexrest/Case/5005h00000W7GUaAAN

//Approach 1
split('/') => ['https:', '', 'falcons8-dev-ed.my.salesforce.com', 'services', 'apexrest', 'Case', '5005h00000W7GUaAAN']
                0         1   2                                    3           4           5       6
                size = 7
                get the element from size-1 = 6 (7n)

//Approach 2
lastIndexOf('/') = 51 (1n)
51+1 = 52
requestUrl.subString(52) = 5005h00000W7GUaAAN
*/



