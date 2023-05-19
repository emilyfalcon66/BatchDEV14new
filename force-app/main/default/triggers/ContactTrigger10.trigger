trigger ContactTrigger10 on Contact (before insert, before update) {
    system.debug('----- trigger start -----');

    for(Contact cont: Trigger.new){
        System.debug('first  Name: '+ cont.firstName);
        System.debug('last  Name: '+ cont.LastName);
        System.debug('Account name:' + cont.AccountId);
        System.debug('Phone number: ' + cont.Phone);
        System.debug('Email: ' + cont.Email);
    }
    system.debug('===== trigger end =====');

}