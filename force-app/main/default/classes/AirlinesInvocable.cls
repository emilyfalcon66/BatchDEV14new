public with sharing class AirlinesInvocable {
    
    @InvocableMethod(label='Send Airlines Information'
    description='Post the newly created airline records into vendor system'
    category='Airlines')
    public static void sendAirilnes(List<Id> airlineIds) {
        for(Id airlineId : airlineIds) {
            RestCallouts.postAirlines(airlineId);
        }
    }
}