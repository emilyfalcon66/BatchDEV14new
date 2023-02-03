public class CollectionsClass {
    public static  string listAssignment(integer i) {
        List<String> LstMonth= new List<String>();
        LstMonth.add('January');
        LstMonth.add('February');
        LstMonth.add('March');
        LstMonth.add('April');
        LstMonth.add('May');
        LstMonth.add('June');
        LstMonth.add('July');
        LstMonth.add('August');
        LstMonth.add('September');
        LstMonth.add('October');
        LstMonth.add('November');
        LstMonth.add('December');
        system.debug('List of Month: ' + LstMonth);

        String output_month= '';

        if (i>=0 && i<LstMonth.size() ){
            output_month=LstMonth[i];
        }else{
            output_month= 'Not a valid month';
        }

        return output_month;

    }
}