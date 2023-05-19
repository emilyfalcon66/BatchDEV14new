public with sharing class PostCallout {
  //  endpoint:  https://api.onlinewebtutorblog.com/employees
  @future(callout=true)
  public static void postMethod(Id empId){
      Employee__c emp = [SELECT Name, Username__c, Gender__c, Email__c, Designation__c, 	PhoneNumber__c, CompleteAddress__c, Integration_Status__c
                         FROM Employee__c
                         WHERE id= :empId];
      EmployeeWrapper empwrp = new EmployeeWrapper();
      empwrp.name = emp.Name;
      empwrp.username = emp.Username__c;
      empwrp.gender = emp.Gender__c;
      empwrp.email = emp.Email__c;
      empwrp.designation = emp.Designation__c;
      empwrp.phone_number = emp.PhoneNumber__c;
      empwrp.complete_address = emp.CompleteAddress__c;
      empwrp.integration_Status = emp.Integration_Status__c;
      String body = JSON.serialize(empwrp);                   
             
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
    request.setMethod('POST');
    request.setBody(body);
    request.setHeader('Content-Type', 'application/json; charset=UTF-8');
  
    Http http = new Http();
  
    HttpResponse response = http.send(request);
    Employee__c emp1 = new Employee__c(Id=empId);
  emp1.Integration_Status__c = response.getBody();
  update emp1;
    
  }
  }