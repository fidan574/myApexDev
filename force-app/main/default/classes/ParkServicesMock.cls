public with sharing class ParkServicesMock implements WebServiceMock {
    public void doInvoke(Object a, Object b, Map<String,Object> response, String d, String e, String i, String f, String g, String h){
        ParksServices.byCountryResponse response_x = new  ParksServices.byCountryResponse();
        response_x.return_x = new List<String> {'Hamburg Wadden Sea National Park', 'Hainich National Park'};
        response.put('response_x', response_x);
    }
    
}
