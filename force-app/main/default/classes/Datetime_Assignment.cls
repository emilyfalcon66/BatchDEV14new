public class Datetime_Assignment {
    public void diffofDate() {
        Date varTomorrowDate= date.newInstance(2023,01,19);
        Date varTodaysDate= date.newInstance(2023,01,18);
        Integer diffOfDays= varTomorrowDate.daysBetween(varTodaysDate);
        system.debug('The difference between the days is ' + diffOfDays);

    }

    public void timeCheck() {
        Datetime varTommorrowDatetime= Datetime.newInstance(2023,01,19,06,00,00);
        Datetime Var10daysDatetime= Datetime.newInstancegmt(2023,01,28,08,00,00);
        long varDatetimeLong= 12339874361L;

        Datetime varAdd7Days= varTommorrowDatetime.addDays(7);
        system.debug('Seven Days after tomorrow will be ' + varAdd7Days);

        Datetime varAdd10Days= varTommorrowDatetime.addDays(10);
        system.debug('Seven Days after tomorrow will be ' + varAdd10Days);




    }
}