@RestResource(urlMapping='/Lead/*')
global with sharing class LeadManager {
    //https://ddn000005kxxtmag-dev-ed.develop.my.salesforce.com/services/apexrest/Lead/00QDn0000031DLbMAM

    @HttpGet
    global static Lead getLead(){
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id leadId = endpoint.substring(lastIndex+1);
        Lead lead = [SELECT Id, Name, Company, Title, Phone, Email, LeadSource, Industry FROM Lead WHERE Id = :leadId];
        return lead;
    }

    @HttpPost
    global static Id postLead(String firstName, String lastName, String company, String title, Integer annualRevenue) {
        Lead lead = new Lead();
        lead.FirstName = firstName;
        lead.LastName= lastName;
        lead.Company = company;
        lead.Title = title;
        lead.AnnualRevenue = annualRevenue;
        insert lead;
        return lead.Id;     
    }

    @HttpDelete
    global static String deleteLead() {
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id leadId = endpoint.substring(lastIndex+1);
        try {
            Lead lead = [SELECT Id FROM Lead WHERE Id= :leadId];
            delete lead;
        } catch (Exception ex) {
            return 'Fail';      
        }
        return 'Success';
    }

    @HttpPut
    global static Lead putLead(){
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Lead lead= (Lead)JSON.deserialize(body, Lead.class);
        upsert lead;
        return lead;
    }

    @HttpPatch
    global static Lead patchLead() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Lead lead= (Lead)JSON.deserialize(body, Lead.class);
        update lead;
        Lead updateLead = [SELECT Id, Name, Title, Company, AnnualRevenue FROM Lead WHERE Id = :lead.Id];
        return updateLead;
    }

    
}