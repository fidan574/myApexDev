RankHandler rk = new RankHandler();
string prize1 = rk.rankPrize(1);
system.debug('Prize1 is ' + prize1);

string prize3 = rk.rankPrize(3);
system.debug('Prize3 is ' + prize3);

string prize8 = rk.rankPrize(8);
system.debug('Prize8 is ' + prize8);

string prize31 = rk.rankPrize(31);
system.debug('Prize31 is ' + prize31);



RankHandler rk1 = new RankHandler();
string prize1z = rk1.rankPrizeSwitch(1);
system.debug('Prize1z is ' + prize1z);

string prize3z = rk1.rankPrizeSwitch(3);
system.debug('Prize3z is ' + prize3z);

string prize8z = rk1.rankPrizeSwitch(8);
system.debug('Prize8z is ' + prize8z);

string prize31z = rk1.rankPrizeSwitch(31);
system.debug('Prize31z is ' + prize31z);