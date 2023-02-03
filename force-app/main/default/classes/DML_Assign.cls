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



}
