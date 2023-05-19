public class SalesforceTicketStatus {
    @invocableMethod
    public static void updateSftStatus(List<Id> SpId) {
        List<Salesforce_Ticket__c>stListToUpdate= new List<Salesforce_Ticket__c>();
        List<Salesforce_Ticket__c>stList= [SELECT Id, Status__c FROM Salesforce_Ticket__c WHERE Salesforce_Project__c=: SpId AND Status__c !='Completed'];

        for (Salesforce_Ticket__c eachST : stList) {
            eachST.Status__c= 'Completed';
            stListToUpdate.add(eachST);    
        }
        if(!stListToUpdate.isEmpty()){
            update stListToUpdate;
        }

    }
}