public class setDemo2 {
    public static set<string>capitalizeSetString(set<string> stringSet) {
        set<string> capsSet = new set<string>();

        for (string eachStr : stringSet){
            string tempstr = eachStr.toUpperCase();
            capsSet.add(tempstr);
        }
        return capsSet;
    }
}
