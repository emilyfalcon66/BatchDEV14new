public class Conditionclass_assignment {    
    public string ifclassmethod(integer value) {
        String output_Month= 'Not a valid Month';
        if(value==1){
            output_Month= 'January';
        }else if(value==2){
            output_Month='February';
        }else{
            output_Month='Not a valid Month';
        }
        return output_Month;

    }
    public string casemethod(string monthname) {
        String output_Quarter= 'Enter a prper Month name';
        switch on monthname{
            when'January', 'February', 'March'{
                output_Quarter='Quarter 1';
            
            }when else{
                output_Quarter= 'Not a valid Quarter';
            }
        }
        return output_Quarter;

    }
}