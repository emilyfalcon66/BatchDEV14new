public class CollectionAssignment {
   Set<String> countriesSet= new Set<String>{'India', 'USA', 'Russia', 'Germany', 
'Singapore', 'Japan'};

public void printLowerCase(){
    Set<String> lowcase= new Set<String>();
    for(string eachS: countriesSet){
        string lwrcase= eachS.toLowerCase();
        lowcase.add(lwrcase);
    }
    system.debug(lowcase);
}

public void printUpperCase(){
    Set<String> upcase= new Set<String>();
    for(string eachS: countriesSet){
        string up= eachS.toUpperCase();
        upcase.add(up);
    }
    system.debug(upcase);
}
}