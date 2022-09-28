public with sharing class GetMultiplyMock implements WebServiceMock{
    public void doInvoke(Object a, Object b, Map<String,Object> response, String d, String e, String i, String f, String g, String h){
        CalculatorServices.doMultiplyResponse response_x = new  CalculatorServices.doMultiplyResponse();
        response_x.return_x = 50;
        response.put('response_x', response_x);
    }
}
