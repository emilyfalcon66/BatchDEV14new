public with sharing class AccountsQueueable2 implements Queueable{
    list<account> listaccount = new list<account>();

    //this is a parameterized constructor.
    public AccountsQueueable2(List<account> accs) {
        listaccount = accs;
    }

    public void execute(QueueableContext qc){
        system.debug('inside execute method listaccount => ' + listaccount);
        //update name of all accounts in listaccount.
            //append --SI in account name
        for (account eachAcc : listaccount) {
            string newName = eachAcc.name.removeEnd('--SI');
            eachAcc.Name = newName;
        }
        update listaccount;
    }
}