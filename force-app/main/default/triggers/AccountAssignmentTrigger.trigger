trigger AccountAssignmentTrigger on Account (before insert,after insert){
    if(trigger.isAfter && trigger.isInsert){
       AccountAssignmentHandler.createContact(trigger.new);
    }








   /*trigger AccountAssignmentTrigger on Account (before insert, before update, after insert, after update) {
    Map<Id,Account> trgNewMap=trigger.newMap;
    Map<Id,Account> trgOldMap=trigger.oldMap;
    //before insert
    if(trigger.isBefore && Trigger.isInsert){
        System.debug('trigger.new --> ' +trigger.new);
        System.debug('trigger.old --> ' +trigger.old);
        System.debug('trigger.newMap--> ' +trigger.newMap);
        System.debug('trigger.oldMap --> ' +trigger.oldMap);
    }
    //before update
    if(trigger.isBefore && Trigger.isUpdate){
        System.debug('trigger.new --> ' +trigger.new);
        System.debug('trigger.old --> ' +trigger.old);
        System.debug('trigger.newMap--> ' +trigger.newMap);
        System.debug('trigger.oldMap --> ' +trigger.oldMap);
    }
    //after insert
    if(trigger.isAfter && Trigger.isInsert){
        for (Account eachAcc : trigger.new) {
            
        System.debug('trigger.new --> ' +trigger.new);
        System.debug('trigger.old --> ' +trigger.old);
        System.debug('trigger.newMap--> ' +trigger.newMap);
        System.debug('trigger.oldMap --> ' +trigger.oldMap);
        System.debug('new account record from map--> ' +trigger.newMap.get(eachAcc.Id));
        }
    }
    //after update
    if(trigger.isAfter && Trigger.isUpdate){
        for (Account eachAcc : trigger.new) {

        System.debug('trigger.new --> ' +trigger.new);
        System.debug('trigger.old --> ' +trigger.old);
        System.debug('trigger.newMap--> ' +trigger.newMap);
        System.debug('trigger.oldMap --> ' +trigger.oldMap);
        System.debug('new account record from map--> ' +trigger.newMap.get(eachAcc.Id));
        System.debug('old account record from map--> ' +trigger.oldMap.get(eachAcc.Id));
        }
    }*/

    

/*if (trigger.isBefore && trigger.isInsert) {
    for (Account eachAcc : trigger.new) {
        if (eachAcc.active__c=='Yes') {
            eachAcc.Description= 'Account is Active';
            
        }
        if (eachAcc.active__c=='No') {
            eachAcc.Description= 'Account is InActive';
        
        }
    
    }
}

    if (trigger.isBefore && trigger.isUpdate) {
        for (Account eachAcc : trigger.new) {
            if (trigger.oldMap.get(eachAcc.Id).active__c !=eachAcc.active__c && eachAcc.active__c =='Yes') {
                eachAcc.Description='Account is Active';
                
            }
            if(trigger.oldMap.get(eachAcc.Id).active__c !=eachAcc.active__c && eachAcc.active__c =='No'){
                eachAcc.Description='Account is InActive';

            }
        } 
    } */
}


 