public class PrimitiveDataTypeDemo2 {
   public void printNewDate(){
    system.debug('create new dates here');

    Date newDate= date.newInstance(1995, 2, 15);
    system.debug('new date is ' + newDate);

    Date newDate2= date.newInstance(2022, 1, 9);
    system.debug('new date2 is ' + newDate2);

    Date todayDate= date.today();
    system.debug('today date is ' + todayDate);



   }
   public void printNewTime(){
    //newInstance Hour,minute,second,miliseconds

    Time myTime= time.newInstance(18, 50, 15, 40);
    system.debug('my time is ' + myTime);

    Time myTime2= time.newInstance(9, 80, 30, 20);
    system.debug('my time2 is ' + myTime2);


   }  


   public void printNewDateTime(){
    Date newDate= date.today();
    Time newTime= time.newInstance(8, 50, 30, 40);

    //1. new ddatetime using ddate and time
    Datetime dt1= Datetime.newInstance(newDate, newTime);
    System.debug('dt1 ' + dt1);

    //2.new datetime using year,month,day
    Datetime dt2= Datetime.newInstance(2020, 5, 25);
    system.debug('dt2 is ' +dt2);

    //3.create datetime using year,month,day,hour,minute,second

    Datetime dt3 = Datetime.newInstance(1999, 9, 14, 2, 50, 30);
    system.debug('dt3 ' +dt3);

    //4. newInstance from longtime
    long longTime=0;
    datetime dt4= datetime.newInstance(longtime);
    system.debug('dt4 ' + dt4);


    long longTime2=1234567876543L;
    datetime dt4_1= datetime.newInstance(longTime2);
    system.debug('dt4_1 ' + dt4_1);
    

    //6. NOW
    datetime dt6= datetime.now();
    system.debug('dt6 is ' +dt6);

    datetime dt5 =datetime.newInstanceGmt(998,5,18,15,15,15);    
system.debug('dt5' + dt5);


   }




 }