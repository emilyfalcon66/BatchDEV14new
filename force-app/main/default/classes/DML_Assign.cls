public  class DML_Assign {
    public static void insert_dml() {
        account acc= new account();
        acc.Name='Emily Assignment';
        insert acc;

        account acc2= new account();
        acc2.Name='Emily Assignment2';
        insert acc2;
    }

    public static void updating_dml(){
        account acc= new account();
        acc.Name='Account Created';
        insert acc;
        acc.Name='Account Updated';
        update acc;

    }
    
    //practice, DML parent-child relationship

    public static id createAccount(){
        account acc= new account();
        acc.Name='Test Account DML';
        insert acc;
        return acc.id;

    }

    public static void createContact(){
        id accId=createAccount();
        contact con= new contact();
        con.lastName= 'Contact DML';
        con.AccountId= accId;
        insert con;

    }

    public static void updateOneContact(){
        account acc=[select id,name from account order by CreatedDate desc limit 1];
        contact con= [select id, lastName from contact where AccountId=null limit 1];
        system.debug('contact is ' + con);
        con.AccountId=acc.id;
        update con;

    }

    public static void createMultipleAccountAndContacts(){
        List<Account> accList= new List<Account>();
        for (Integer i=1; i<=5; i++){
         account acc= new account();
            acc.name= 'Account Demo' +i;
            accList.add(acc);
        }
        if( !accList.isEmpty()){
            insert accList;
        }

        List<Contact> conList= new List<Contact>();
        for (account ac:accList){
            contact cn= new Contact();
            cn.lastName='Contact Demo' + i;
            cn.AccountId= ac.id;
            conList.add(cn);
            }
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }
}


