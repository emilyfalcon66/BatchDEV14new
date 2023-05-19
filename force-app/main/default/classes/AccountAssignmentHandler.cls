public class AccountAssignmentHandler {
    public static void createContact(List<Account> accTriggerNew) {
        List<Contact> contactList= new List<Contact>();
        for (Account eachAcc : accTriggerNew) {
            Contact newCont= new Contact();
            newCont.AccountId= eachAcc.Id;
            newCont.LastName= 'Falcon';
            contactList.add(newCont);
            
        }
        if(!contactList.isEmpty()){
            insert contactList;
        }

    }
}