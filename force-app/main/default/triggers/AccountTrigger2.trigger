/*trigger AccountTrigger2 on Account (before insert, after insert) {
   system.debug('----- trigger start -----');

    system.debug('Trigger.isBefore --> ' + Trigger.isBefore);
    system.debug('Trigger.isAfter --> ' + Trigger.isAfter);
    if(Trigger.isBefore){
        system.debug('before insert trigger called.');
    }
    if(Trigger.isAfter){
       system.debug('after insert trigger called.');
    }

       system.debug('===== trigger end =====');
}*/

/*trigger AccountTrigger2 on Account (before insert, before update) {
    system.debug('----- trigger start -----');

    //.isInsert wil be true when triggerr is running while inserting
    system.debug('trigger.isInsert--> ' + trigger.isInsert);
    
    if(trigger.isInsert){
        system.debug('before insert trigger called.');
    }
    system.debug('trigger.isUpdate--> ' + trigger.isUpdate);
    if(trigger.isUpdate){
        system.debug('before update trigger called.');
    }

    system.debug('===== trigger end =====');

    
    system.debug('Trigger.isBefore --> ' + Trigger.isBefore);
    system.debug('Trigger.isAfter --> ' + Trigger.isAfter);
    if(Trigger.isBefore){
        system.debug('before insert trigger called.');
    }
    if(Trigger.isAfter){
        system.debug('after insert trigger called.');
    }

    
}*/

trigger AccountTrigger2 on Account (before insert, before update, after insert, after update) {
    system.debug('----- trigger start -----');

    if(Trigger.isAfter){
        system.debug('after insert/update new records : ' + trigger.new);
    }

    system.debug('===== trigger end =====');
}