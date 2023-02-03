public class String_Assignment {
    public void printLocalString() {
        String localString= 'Thanks for the session o the string';
        system.debug(localString);

        Integer lengthOfLocalString= localString.length();
        system.debug('The length of string is ' + lengthOfLocalString);

        String uppercaseOfLocalString= localString.toUpperCase();
        system.debug( 'write uppercase ' + uppercaseOfLocalString);

        Boolean sessionContains1= localString.contains('session');
        system.debug('The string has word sesion in it :' + sessionContains1);

        Boolean sessionContains2= localString.contains('sessions');
        system.debug('The string has word sesions in it :' + sessionContains2);

        Boolean sessionContains3= localString.containsIgnoreCase('SESSION');
        system.debug('The string has word SESSION in it :' + sessionContains3);



    }
}