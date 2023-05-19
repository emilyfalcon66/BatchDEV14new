public class AccountUpdateHandler {
    public static void accBillingCityUpdate(List<Account>accTriggerNew, List<Account>accTriggerOld, Map<Id,Account>accNewMap, Map<Id,Account>accOldMap) {
        Set<Id> accIDS= new Set<Id>();

        for (account eachAcc : accTriggerNew) {
            if (eachAcc.BillingCity !=accOldMap.get(eachAcc.Id).BillingCity) {
                accIDS.add(eachAcc.Id);
                
            }   
        }
        List<Contact>contList= [SELECT id, mailingCity, AccountId FROM Contact WHERE AccountId IN: accIDS ];
        for(Contact eachCont: contList){
            eachCont.MailingCity=accNewMap.get(eachCont.AccountId).BillingCity;
        }
        if(!contList.isEmpty()){
            update contList;
        }
        
    }










    /*@invocableMethod
    public static void updateAccountWebsite(list<Id> accIds) {
        list<account> listAccount = [select id, website from account where id in :accIds];
        for (account eachAccount : listAccount) {
            eachAccount.Website = 'www.softinnovas.com';
        }
        update listAccount;
    }*/
}

