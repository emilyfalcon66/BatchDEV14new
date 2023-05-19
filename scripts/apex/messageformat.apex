//JSON format
{
    "Name" : "ABC Pvt Ltd",
    "Type" : "Consulting",
    "Inddustry" : "Education",
    "AnnualRevenue" : 2000000,
    "Established" : 2000,
}
//Get an account record, convert that into JSON format
Account acc = [SELECT Id, Name, Type, Industry, AnnualRevenue 
                FROM Account 
                WHERE Type !=null 
                AND Industry !=null 
                AND AnnualRevenue !=null             
                LIMIT 1];
String jsonString = JSON.serialize(acc);
System.debug(jsonString);

//Get 5 account records, convert them onti json format
List<Account> accounts = [SELECT Name, Type, Industry, AnnualRevenue 
                        FROM Account 
                        WHERE Type !=null 
                        AND Industry !=null 
                        AND AnnualRevenue !=null 
                        LIMIT 5];
String jsonString = JSON.serialize(accounts);
System.debug(jsonString);

//Get Opportunity recordd, convert that into JSON format
//Name, Type, Stage, Amount
Opportunity opp = [SELECT  Id, Name, Type, StageName, Amount FROM Opportunity WHERE Type !=null AND StageName !=null AND Amount !=null LIMIT 1];
String jsonString = JSON.serialize(opp);
System.debug(jsonString);

//Get top 10 opportunities based on Amount, convert them into JSON format
List<Opportunity> opps = [SELECT Id, Name, Type, StageName, Amount
                          FROM Opportunity
                          WHERE Type != null
                          AND StageName != null
                          AND Amount != null
                          ORDER BY Amount DESC
                          LIMIT 10];
String jsonString = JSON.serialize(opps);
System.debug(jsonString);

//JSON.Serialize=apexx formattan json formata donusturur.
//JSON.Deserialize=Json formattan apex e donusturur.

//TestCallouts
RestCallouts.getAnimals();

RestCallouts.getAirlines();



RestCallouts.getEmployees();
RestCallouts.getCaseInfo();

RestCallouts.postAnimal();

CovidCallouts.getCovid();

//Test SOAP Callouts
SoapCallouts.getParksByCountry('Germany');
SoapCallouts.doAddCallout(20,30);
SoapCallouts.doMultiplyCallout(5,3);