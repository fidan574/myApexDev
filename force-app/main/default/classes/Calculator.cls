public class Calculator {
    public void printNewMessage(string msg){
        system.debug(msg);   
    }

    public void add(integer a, integer b){
        integer sum = a + b;
        system.debug(sum);

    }
    public string  printAndReturnMessage(string msg){
        string returnStr = msg + '...OK Cool';
        return returnStr;
    }
    public boolean leapYearCheck(date dt){
        integer dtYear = dt.year();
        boolean lp = date.isLeapYear(dtYear);
        return lp;

    }
}
