public with sharing class SoapCallouts {
    Public Static String[] getParksByCountry(String country){
        ParksServices.ParksImplPort parkService = new ParksServices.ParksImplPort();
        String[] parks = parkService.byCountry(country);
        System.debug(parks);
        return parks;
    }

    Public Static Double getSum(Double Num1, Double Num2){
        CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
        Double output = calcService.doAdd(num1, num2);
        return output;
    }
    Public Static Double getMultiply(Double Num1, Double Num2){
        CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
        Double output = calcService.doMultiply(num1, num2);
        return output;
    }
    Public Static Double getSubstract(Double Num1, Double Num2){
        CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
        Double output = calcService.doSubtract(num1, num2);
        return output;
    }
    Public Static Double getdivide(Double Num1, Double Num2){
        CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
        Double output = calcService.doDivide(num1, num2);
        return output;
    }
}
