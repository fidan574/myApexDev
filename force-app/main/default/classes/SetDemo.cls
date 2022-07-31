public class SetDemo {
    public static void citySet() {
        Set<string> cities = new Set<string>();
        cities.add('Tokyo');
        cities.add('Berlin');
        cities.add('Nairobi');
        cities.add('Lisbon');
        cities.add('Tokyo');
        cities.add('Berlin');
        cities.add('Nairobi');
        cities.add('Lisbon');
        cities.add('Tokyo');
        cities.add('Berlin');
        cities.add('Nairobi');
        cities.add('Lisbon');

        system.debug('list of cities ' + cities);
    }
    public static Set<integer> setFromList(list<integer> intList){
        Set<integer> intSet = new Set<integer>();
        intSet.addAll(intList);
        return intSet;
    }
}
