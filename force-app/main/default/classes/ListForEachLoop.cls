public class ListForEachLoop {
    public static void iterateListInteger(){
        List<integer> listInteger = new List<integer>();
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);

        for (integer eachInteger : listInteger){
            system.debug(eachInteger);
        }
    }

    public static integer add(List<integer> listInt){
        integer returnInt = 0; 
        
        for (integer eachInteger : listInt){
            returnInt = returnInt + eachInteger;
        }

        return returnInt;   
    }
}
