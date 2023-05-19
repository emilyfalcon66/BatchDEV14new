public with sharing class ProductControl {
    @AuraEnabled
    public static List<Ecommerce_Product__c> getProducts(integer amount){
        return [SELECT Id,Name,Title__c, Brand__c,Price__c,Category__c
                FROM Ecommerce_Product__c
                WHERE Price__c<=:amount
                WITH SECURITY_ENFORCED];
    }
    
}