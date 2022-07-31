public class PrimativeDataTypeDemo3 {
    public void printNewDate(){
        system.debug('We will create new Date inctance');

        Date newDate = Date.newInstance(1995, 2, 17);
        Date newDate2 = Date.newInstance(2021, 10, 7);

        system.debug('New date is ' +  newDate);
        system.debug('New date is ' + newDate2);

        Date todayDate = Date.today();
        system.debug('Today\'s date is ' + todayDate);

    }
    public void printNewTime(){

        Time myTime = Time.newInstance(13, 00, 30, 30);
        Time meTime = Time.newInstance(6, 00, 00, 00);

        system.debug('My time is ' + myTime);
        system.debug('Me time is ' + meTime);

    }
    public void printNewDateTime(){
        //new datetime form date and time
        Date newDate = Date.today();
        Time newTime = Time.newInstance(9, 9, 0, 0);
        Datetime dt1 = Datetime.newInstance(newDate, newTime);

        system.debug('dt1 is ' + dt1);
        //new datetime from year,month,day
        Datetime dt2 = Datetime.newInstance(2000, 02, 22);
        system.debug('dt2 is ' + dt2);
        
        //new datetime from y,m,d,h,m,s
        datetime dt3 = datetime.newInstance(2022, 7, 7, 8, 0, 0);
        system.debug('dt3 = ' + dt3);

        //new datetime (from milliseconds) with LONG
        long longNumber = 0L;
        datetime dt4 = datetime.newInstance(longNumber);
        system.debug('dt4 is ' + dt4);

        long longNumber2 = 123457676567L;
        datetime dt4_1 = datetime.newInstance(longNumber2);
        system.debug('dt4_1 is ' + dt4_1);

        //current time
        datetime dt6 = datetime.now();
        system.debug('dt6 is ' + dt6);

        //newInstance GMT
        datetime dt5 = datetime.newInstanceGMT(2022, 2, 22, 2, 22, 22);
        system.debug('dt5 is ' + dt5);







        
    }

}
