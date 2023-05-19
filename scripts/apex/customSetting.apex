Map<String, country_code__c> countryCodes= country_code__c.getAll();
system.debug('countryCode map ' + countryCodes)

for(string eachName : countryCodes.keySet()){
    system.debug('country is ' + eachName + ', its code is ' + countryCodes.get(eachName).code__c)
}