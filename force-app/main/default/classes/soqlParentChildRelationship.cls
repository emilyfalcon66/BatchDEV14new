public class soqlParentChildRelationship {
    public static void childToParent() {
        list<Contact> Istcontact= [select ID, name, account.ID, account.name from Contact];
        for (Contact eachContact: Istcontact){
            system.debug('Account ID is '+ eachContact.account.ID+ 'and Account name is ' + eachContact.account.name);
        }


    }
    public static void parentToChild() {
        list<Account> Istaccount= [select ID, name,(select ID, name from Contacts) from Account];
        for (Account eachAccount: Istaccount){
            list<contact> listAcc= eachAccount.Contacts;
            for(contact eachContacts: listAcc)
            system.debug('Countact ID is '+ eachContacts.ID+ 'and Contact name is' + eachContacts.name);
        }


    }
}