public class Candidates {
    public string name;
    public string gender;
    public static string companyName;

    public void printCandidate(){

        system.debug('------start-----');
        system.debug('candidate name is ' + name + ', gender is ' + gender);
        system.debug('company name is ' + companyName);
        system.debug('------end------');
    }
}