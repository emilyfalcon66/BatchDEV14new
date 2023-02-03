public class Calculator {
    public void welcomeMessage() {
        system.debug('welcome to apex calc');

    }

    public  void printNewMesssage(string msg){
        system.debug(msg);

        //default access modifier=> private
        //private is accessible only inside 

    }

    public string printAndReturnMessage(string m){
    string returnStr= '';
    system.debug('message is ' + m);
    returnStr= m+ '...OK Cool';
    return returnStr;

    }


    public integer add(integer a,integer b){
        integer sum = a+b;
        return sum;


    }

    public integer add(integer x, integer y, integer z){
        integer sum= x+y+z;
        return sum;


    }

    public Boolean leapYearCheck(date dt){
        integer year= dt.year(); //returns year component
        //year= 2023
        boolean lp=date.isLeapYear(year);
        //lp= false
        return lp;


    }

    


}