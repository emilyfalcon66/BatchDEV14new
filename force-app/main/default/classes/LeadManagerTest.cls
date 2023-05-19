@isTest
public with sharing class LeadManagerTest {
    @TestSetup
    private static void makeData(){
        List<Lead>leads = new List<Lead>();
        for (Integer i=0; i<=2; i++) {
            Lead ld= new Lead(lastName='Test Lead' +i);
            ld.FirstName= 'Bala';
            ld.Company='SI';
            ld.LeadSource= 'Web';
            leads.add(ld);          
        }
        insert leads;       
    }
    @isTest
    private static void getLeadTest () {
        test.startTest();
        //1.Prepare RestRequest and wrap all the necessary information in it.
        Lead ld= [SELECT Id,Name, Company, Title, LeadSource FROM Lead LIMIT 1];
        String endpoint =System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Lead/' + ld.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'GET';
        //2.Prepare RestContext
        RestContext.request = request;

        //3.Make callout
        Lead lead1 = LeadManager.getLead();
        //4.Perform asserts
        Assert.areEqual(ld.Name, lead1.Name);
        Assert.areEqual(ld.LeadSource, lead1.LeadSource);
        Test.stopTest();
      
    }

    @isTest
    private static void postLeadTest(){
        Test.startTest();
        //1.Make callout
        Id leadId = LeadManager.postLead('Test Lead','Bala','SI', 'Dev', 2000000);
        //4.Perform asserts
        Assert.isNotNull(leadId);
        Test.stopTest();      
    }

    @isTest
    private static void deleteLeadTest(){
        Test.startTest();
        //1.Prepare RestRequest and wrap all the necessary information in it.
        Lead lead = [SELECT Id FROM Lead LIMIT 1];
        String endpoint =System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Lead/' + lead.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'DELETE';

        //2.Prepare RestContext
        RestContext.request = request;

        //3.Make callout(success case)
        String status = LeadManager.deleteLead();

        //4.Perform asserts(success case)
        Assert.areEqual('Success', status);
        Test.stopTest();      
    }

    @isTest
    private static void deleteLeadFailTest(){
        Test.startTest();
        //1.Prepare RestRequest and wrap all the necessary information in it.
        Lead lead = [SELECT Id FROM Lead LIMIT 1];
        String endpoint =System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Lead/' + lead.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'DELETE';

        //2.Prepare RestContext
        RestContext.request = request;

        //3.Make callout(success case)
        String statusOld = LeadManager.deleteLead();
        String statusnew = LeadManager.deleteLead();

        //4.Perform asserts(success case)
        Assert.areEqual('Fail', statusnew);
        Test.stopTest();      
    }

    @isTest
 private static void putLead(){
    //1. Prepare RestRequest and wrap all the necessary information in  it
    //Step 1
    Lead lead = new Lead(LastName='My Lead', Company='New Lead',Title='Electronics', LeadSource='Web', Email='B@g.com', Phone= '1223456');
    string body = JSON.serialize(lead);
    // Step 2
    RestRequest Request = new RestRequest();
    request.requestBody = Blob.valueOf (body);
    request.httpMethod = 'PUT';

    //2. Prepare RestContex
    RestContext.request = request;
    //3. Make Callout
    Lead newLead = LeadManager.putLead();
    //4. Perform asserts
    Assert.isNotNull(newlead.Id);
    Assert.areEqual(lead.LastName, newLead.LastName);
    Assert.areEqual(lead.LeadSource,newLead.LeadSource);    
    }

    @isTest
private static void patchLead(){
   //1. Prepare RestRequest and wrap all the necessary information in  it
   //Step 1
   Lead lead = [SELECT Id, Name, Industry, LeadSource  FROM Lead LIMIT 1];
   lead.Industry= 'Education';
   lead.LeadSource = 'Phone Inquiry';
   string body = JSON.serialize(lead);
   // Step 2
   RestRequest Request = new RestRequest();
   request.requestBody = Blob.valueOf (body);
   request.httpMethod = 'PATCH';

   //2. Prepare RestContex
   RestContext.request = request;
   //3. Make Callout
   Lead updatelead = LeadManager.patchLead();
   //4. Perform asserts
   Assert.areEqual('Education', updatelead.Industry);
   Assert.areEqual('Phone Inquiry', updatelead.LeadSource);
   
}


}