@RestResource(urlMapping='/Contact/*')
global with sharing class ContactManager {//https://ddn000005kxxtmag-dev-ed.develop.my.salesforce.com/services/apexrest/Contact/003Dn0000074aQtIAI

    @HttpGet
    global static Contact getContact(){
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id contactId = endpoint.substring(lastIndex+1);
        Contact cont = [SELECT Id, FirstName, LastName, Email, Title, Department FROM Contact WHERE Id = :contactId];
        return cont;
    }

    @HttpPost
    global static Id postContact(String firstName, String lastName, String email, String title, String department ) {
        Contact cont = new Contact();
        cont.FirstName = firstName;
        cont.LastName = lastName;
        cont.Email = email;
        cont.Title = title;
        cont.Department = department;
        insert cont;
        return cont.Id;     
    }

    @HttpDelete
    global static String deleteContact() {
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id contId = endpoint.substring(lastIndex+1);
        try {
            Contact cont = [SELECT Id FROM Contact WHERE Id= :contId];
            delete cont;
        } catch (Exception ex) {
            return 'Fail';      
        }
        return 'Success';
    }

    @HttpPut
    global static Contact putContact(){
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Contact cont= (Contact)JSON.deserialize(body, Contact.class);
        upsert cont;
        return cont;
    }

    @HttpPatch
    global static Contact patchContact() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Contact cont= (Contact)JSON.deserialize(body, Contact.class);
        update cont;
        Contact updateCont = [SELECT Id, FirstName, LastName, Email, Title, Department FROM Contact WHERE Id = :cont.Id];
        return updateCont;
    }
    
}