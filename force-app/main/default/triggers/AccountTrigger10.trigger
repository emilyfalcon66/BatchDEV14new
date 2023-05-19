/*trigger AccountTrigger10 on Account (before insert, after insert, before update, after update) {
    system.debug('----- trigger start -----');

    for(Account acc: Trigger.new){
        system.debug('Account name: ' + acc.Name);
        system.debug('Rating: ' + acc.Rating);
        system.debug('Description: '+ acc.Description);
        system.debug('Mailing city: ' + acc.Mailing_City__c);
    }
    system.debug('===== trigger end =====');

}*/
if(trigger.isAfter && trigger.isUpdate){
    AccountUpdateHandler.accBillingCityUpdate(trigger.new, trigger.old, trigger.newMap,trigger.oldMap);
}