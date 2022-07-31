public class DateTimeMethodsDemo {
    public void calculateAgeInMonths(){
        //birthday
        date birthdate = Date.newInstance(1986, 9, 10);

        //today's date
        date todayDate = date.today();
        
        //calculate difference
        integer ageInMonths = birthdate.monthsBetween(todayDate);

        system.debug('zeynep\'s age in months ' + ageInMonths);

        

    }
    public void calculateAgeInDays(){
        //birthday
        date birthdate = Date.newInstance(1986, 9, 10);

        //today's date
        date todayDate = date.today();
        
        //calculate difference
        integer ageInDays = birthdate.daysBetween(todayDate);

        system.debug('zeynep\'s age in days ' + ageInDays);

    }
}
