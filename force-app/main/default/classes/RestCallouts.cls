public with sharing class RestCallouts {
    //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Http Method: GET
    public static HttpResponse getAnimals(){

        //1.Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');

        //2.Prepare internet
        Http http = new Http();

        //3.Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4.Process the response
        System.debug(response.getStatus());
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
        return response;
        
      
      } 
       //Endpoint: https://api.instantwebtools.net/v1/airlines/1
       //Http Method: GET
       public static HttpResponse getAirlines(){

        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines/1');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        if (response.getStatusCode() == 200){
            String jsonString = response.getBody();
            //Convert json string into wrapper
            AirlinesWrapper wrapper = (AirlinesWrapper)JSON.deserialize(jsonString, AirlinesWrapper.class);
            
            //Convert wrapper into sobject record
            Airlines__c airline = new Airlines__c();
            airline.Name = String.valueOf(wrapper.id);
            airline.Name__c = wrapper.name;
            airline.Country__c = wrapper.country;
            airline.Logo_URL__c = wrapper.logo;
            airline.Slogan__c = wrapper.slogan;
            airline.Head_quarters__c = wrapper.head_quarters;
            airline.Website__c = wrapper.website;
            airline.Established__c = wrapper.established;

            //create airlines record
            try {
                if(Schema.SObjectType.Airlines__c.isCreateable())
                insert airline;
            } catch (Exception ex) {
                System.debug(ex.getMessage());
                
            }
        }else {
            System.debug(response.getStatus());
            System.debug(response.getStatusCode());
            System.debug(response.getBody());       
        }
        return response;
       }

       //Endpoint: https://api.onlinewebtutorblog.com/employees 
       //Http Method: GET
       public static HttpResponse getEmployees() {

        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4.Process the response
        if (response.getStatusCode() == 200) {
            String jsonString = response.getBody();
            //Convert json string into wrapper
            EmployeeWrapper empWrapper = (EmployeeWrapper)JSON.deserialize(jsonString, EmployeeWrapper.class);
            List<EmployeeWrapper.Employee> employees = empWrapper.data;
            //Convert wrapper into sobject
            List<Employee__c> emps = new List<Employee__c> ();
            for (EmployeeWrapper.Employee empWrap : employees) {
                Employee__c emp = new Employee__c();
                emp.Name = String.valueOf(empWrap.id);
                emp.Name__c = empWrap.name;
                emp.Username__c = empWrap.username;
                emp.Email__c = empWrap.email;
                emp.Designation__c = empWrap.designation;
                emp.Gender__c = empWrap.gender;
                emp.CompleteAddress__c= empWrap.complete_address;
                emp.PhoneNumber__c = empWrap.phone_number;
                emps.add(emp);
                
            }
            //insert employee records
            try {
                insert emps;
            } catch(Exception ex) {
                System.debug(ex.getMessage());
            }
        }else {
            System.debug(response.getStatus());
            System.debug(response.getStatusCode());
            System.debug(response.getBody());
        }
        
        return response;
    }

    //Endpoint: //https://ddp000000evjfmaa-dev-ed.develop.my.salesforce.com/services/apexrest/Case/500Dp000003bYYyIAM
    //Http Methodd: GET
    public static HttpResponse getCaseInfo() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:EF_NewBatch14/services/apexrest/Case/500Dp000003bYYyIAM');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        System.debug(response.getStatus());
        System.debug(response.getStatusCode());
        System.debug(response.getBody());   
        return response;


    }
   //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Http Method: POST
    public static HttpResponse postAnimal() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        //set json body
        request.setBody('{"name":"mighty moose"}');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        //2. Prepare internet
        Http http = new Http();
        
        //3. Send the request over the internet in order to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        System.debug(response.getStatus()); //OK, Created
        System.debug(response.getStatusCode()); //201, 200
        System.debug(response.getBody());
        return response;
    }

 //Endpoint: https://api.instantwebtools.net/v1/airlines
    //Http Method: POST
    @future(callout=true)
    public static void postAirlines(Id airlineId) {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines');
        request.setMethod('POST');
        //set json body
        Airlines__c airline = [SELECT Name, Name__c, Country__c, Logo_URL__c, Slogan__c, Head_Quarters__c, Website__c, Established__c 
                                FROM Airlines__c
                                WHERE Id = :airlineId];
        AirlinesWrapper wrapper = new AirlinesWrapper();
        wrapper.country = airline.Country__c;
        wrapper.established = airline.Established__c;
        wrapper.head_quarters = airline.Head_Quarters__c;
        wrapper.logo = airline.Logo_URL__c;
        wrapper.name = airline.Name__c;
        wrapper.slogan = airline.Slogan__c;
        wrapper.website = airline.Website__c;
        String body = JSON.serialize(wrapper);
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet in order to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200 || response.getStatusCode() == 201) {
            System.debug('Data has been sent successfully!');
        } else {
            System.debug(response.getBody());
        }
    }

    //Endpoint: https://api.onlinewebtutorblog.com/employees
    //Http Method: POST
    @future(callout=true)
    public static void postEmployees(Id employeeId) {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('POST');
        //set json body
        Employee__c employee = [SELECT Name, Username__c, Name__c, Email__c, Gender__c, Designation__c, PhoneNumber__c, CompleteAddress__c
                                FROM Employee__c
                                WHERE Id =:employeeId];
        EmployeeWrapper.Employee wrapper = new EmployeeWrapper.Employee();
        wrapper.username = employee.Username__c;
        wrapper.name = employee.Name__c;
        wrapper.email = employee.Email__c;
        wrapper.gender = employee.Gender__c;
        wrapper.designation = employee.Designation__c;
        wrapper.phone_number = employee.PhoneNumber__c;
        wrapper.complete_address = employee.CompleteAddress__c;

        String body = JSON.serialize(wrapper);
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet in order to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200 || response.getStatusCode() == 201) {
            System.debug('Data has been sent successfully!');
        } else {
            System.debug(response.getBody());
        }
    }
}