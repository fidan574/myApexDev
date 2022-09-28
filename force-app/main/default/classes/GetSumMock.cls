public with sharing class GetSumMock implements WebServiceMock{
    public void doInvoke(Object a, Object b, Map<String,Object> response, String d, String e, String i, String f, String g, String h){
        CalculatorServices.doAddResponse response_x = new  CalculatorServices.doAddResponse();
        response_x.return_x = 15.0;
        response.put('response_x', response_x);
    }
}
