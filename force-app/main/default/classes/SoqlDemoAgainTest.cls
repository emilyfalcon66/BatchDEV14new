@isTest
public class SoqlDemoAgainTest {
    @isTest
   public static void testchildToParent_SOQL1() {
    //1. prepare data
    //3 account
    Account acc = new account();
    acc.Name = 'test 1';
    acc.Industry = 'Energy';

    Account acc2 = new account();
    acc2.Name = 'test 2';
    acc2.Industry = 'Energy';

    Account acc3 = new account();
    acc3.Name = 'test 3';
    acc3.Industry = 'Banking';

    list<account> listAcc = new list<account>{acc, acc2, acc3};
    insert listAcc;

    //300 contacts. 100 contacts for each account.
    List<contact> listCon = new list<contact>();
    for (Integer i = 0; i < 300; i++) {

        contact c = new contact();
        c.LastName = 'anything ' + i;

        if (i < 100) {
            c.accountId = acc.id;
        } else if(i < 200){
            c.AccountId = acc2.id;
        } else {
            c.AccountId = acc3.id;
        }
        listCon.add(c);
    }
    insert listCon;

    //start test
    Test.startTest();
    SoqlDemoAgainTest.childToParent_SOQL1();
    Test.stopTest();
    //call method
    //stop test

    //no assertion required because our method is NOT doing anything.

   }
}