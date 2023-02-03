public class DatetimeMethodsDemo {
    public void calculateAgeInMonths(){
        date birthDate= date.newInstance(1984,9,9);
        date  todayDate=  date.today();

        integer ageInMonths=  birthDate.monthsBetween(todayDate);
        system.debug('Emily age in months is ==>' +ageInMonths);

        integer ageInDays=  birthDate.daysBetween(todayDate);
        system.debug('Emily age in days is ==>' +ageInDays);

    }

    //subscription is done for 1000 days
        //assuming that subscription 
        public void printSubscriptionEndDate(){

        date subStartDate= date.today();
        date subEndDate= SubStartDate.addDays(1000);
        system.debug('subscription end date is==> ' +subEndDate);

        //year
        integer endDateYear= subEndDate.year();
        system.debug('year of end date' + endDateYear);

        //month
        integer endDateMonth= subEndDate.month();
        system.debug('month of end date' + endDateMonth);



    }
    

    public void printOfferEndDate(){

        datetime offerStart= datetime.now();
        datetime offerEnd= offerStart.addHours(51);

        system.debug('offer end datetime is ' + offerEnd);

        //just the date component of offer enddate

        Date offerEndDate= offerEnd.date();
        system.debug('offer enddate is ' + offerEndDate);



    }

    public void birthDateInMS(){
        datetime birthDT= datetime.newInstance(1934,9,9,7,30,10);
        long birthDateMS= birthDt.getTime();
        system.debug('Emily birth ddatetime in milisecondds--> ' +birthDateMS);



    }
}