public class DateTimeMethodsDemo2 {
    public void printSubscriptionEndDate(){
        //subscription start date as TODAY
        date subscriptionStartDate = date.today();

        //End date is after 1000 days
        date subscriptionEndDate = subscriptionStartDate.addDays(1000);system.debug('Subscription end date is ' + subscriptionEndDate);
        
        //get year and month of END DATE and print it
        integer endDateYear = subscriptionEndDate.year();
        system.debug('Subscription end date year is ' + endDateYear);

        integer endDateMonth = subscriptionEndDate.month();
        system.debug('Subscription end date month is ' + endDateMonth);
    }

    public void printOfferEndDatetime(){
        //current datetime
        datetime dtNow = datetime.now();

        //offer end datetime
        datetime dtOfferEnd = dtNow.addHours(51);
        system.debug('Offer end datetime is ' + dtOfferEnd);

        date dateOfferEnd = dtOfferEnd.date();
        system.debug('Offer end date is ' + dateOfferEnd);


    }
}
