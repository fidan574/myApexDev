map<string, string> mapCntCurrency = new map<string, string>();
mapCntCurrency.put('USA', 'Dollar');
mapCntCurrency.put('France', 'Euro');
mapCntCurrency.put('Japan', 'Yen');
mapCntCurrency.put('India', 'Rupees');
mapCntCurrency.put('India', 'Rupee');
mapCntCurrency.put('Turkey', 'Lira');
mapCntCurrency.put('El Salvador', 'Bitcoin');
mapCntCurrency.put('Germany', 'Euro');
system.debug(mapCntCurrency);

string IndiaCurrency = mapCntCurrency.get('India');
string TurkeyCurrency = mapCntCurrency.get('Turkey');

system.debug('India currency is ' + IndiaCurrency);
system.debug('Turkey currency is ' + TurkeyCurrency);

set<string> countrySet = mapCntCurrency.keySet();
system.debug('All countries\'s  in map are ' + countrySet);

list<string> currencyList = mapCntCurrency.values();
system.debug('All currencies in map are ' + currencyList);

set<string> countries = mapCntCurrency.keySet();
for(string eachKey  : countrySet){ 
    string printString = 'Country is ' + eachKey;
    system.debug(printString);

    string eachValue = mapCntCurrency.get(eachKey);

    printString = printString + ', its currency is ' + eachValue;
   

    system.debug(printString);
}