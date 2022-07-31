public class ListDemo {
    public static string candidateList(integer i) {
        List<string> ListCandidate = new List<string>();
        ListCandidate.add('Zeynep');
        ListCandidate.add('Ayse');
        ListCandidate.add('Ilker');
        ListCandidate.add('Yusuf');
        system.debug('Candidates are ' + ListCandidate);

        integer sizeOfList = ListCandidate.size();
        string returnString = '';
        if(i>=0 && i<sizeOfList){
            returnString = ListCandidate[i];
        } else {
            returnString = 'No Values Found. Stay in limits.';
        }
        return returnString;
    }
    public static void randomIntegerList() {
        List<integer> integerList = new List<integer>();
        integerList.add(10);
        integerList.add(15);
        integerList.add(21);
        integerList.add(15);
        integerList.add(15);
        system.debug('List of random integers = ' + integerList);
        
        integer index3Value = integerList.get(3);

        integer index3Value2 = integerList[3];
        system.debug('value at index3Value ' + index3Value);
        system.debug('value at index3Value2 ' + index3Value2);
    }
    public static void allCats() {
        Cat falconsCat = new Cat('fluffykins', 'white');
        Cat vitapsCat = new Cat('Simba', 'Brown');
        Cat zeynepsCat = new Cat('Limon', 'Yellow');

        List<Cat> cats = new list<Cat>();
        cats.add(falconsCat);
        cats.add(vitapsCat);
        cats.add(zeynepsCat);
        cats.add(vitapsCat);
        cats.add(vitapsCat);
        system.debug('All cats =  ' + cats);

        if(!cats.isEmpty()){
            cat catAt2 = cats[2];
            system.debug('Cat at 2 is ' + catAt2);
        }

    }
}
