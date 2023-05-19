try{
    account a= new account();
insert a;
} catch(exception ex){
    System.debug('something went wrong buddy');
}

system.debug('Apex is simple');
try{
    account a = new account();
    insert a;
} catch(DmlException dmlex){
    system.debug('dml went wrong buddy');
    system.debug('dml ex message: ' + dmlex.getDmlMessage(0));
    system.debug('ex messge ' + dmlex.getMessage());
    //send email to admin and devs 
    //log in error object
} catch(Exception ex){
    system.debug('something went wrong buddy');
    system.debug('ex messge ' + ex.getMessage());
    //log in error object
}


system.debug('Apex is SIMPLE');