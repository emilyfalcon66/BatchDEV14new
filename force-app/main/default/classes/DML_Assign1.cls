public class DML_Assign1 {
    public void insertRecords() {
        List<Account> AccInsertList= new List<Account>();
        for(integer i=0; i<20; i++){
            account acc=new account();
            acc.name= 'Test Accouunt' + i + ' created';
            AccInsertList.add(acc);
    }
    if(!AccInsertList.isEmpty()){
        insert AccInsertList;
    }
}
public void updateRecords(){
    List<Account>listQueryAcc=[select id,name from Account order by CreatedDate desc limit 20];
    List<Account>  AccUpdateList=new List<Account>();
    for(Account eachAcc: listQueryAcc){
        eachAcc.Name +='Updated';
        AccUpdateList.add(eachAcc);
    }
    if(!AccUpdateList.isEmpty()){
        update AccUpdateList;
    }
}

}