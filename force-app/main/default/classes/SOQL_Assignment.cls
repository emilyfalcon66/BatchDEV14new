public class SOQL_Assignment {
    public static void soql_WhereClause(){
        list<contact> Istcontact= [select ID, name,lastName from Contact where lastName like '%A%'];
        system.debug('Size of the list==> ' + Istcontact.size());
    }

    public static void soql_formethod(){
        list<contact> Istcontact= [select ID, LastName,Phone from Contact];
        for( contact eachRecord: Istcontact){
            system.debug('lastname is ' + eachRecord.LastName);
            system.debug('phone number is ' + eachRecord.Phone);
        }
    }
}