public with sharing class CovidCallouts {
    //Endpoint: https://api.covidtracking.com/v1/us/current.json
    //Http Method: GET
    public static HttpResponse getCovid() {
         //1.Prepare HttpRequest and wrap all the necessary data in it
         HttpRequest request = new HttpRequest();
         request.setEndpoint('https://api.covidtracking.com/v1/us/current.json');
         request.setMethod('GET');
 
         //2.Prepare internet
         Http http = new Http();
 
         //3.Send the request over the internet to receive HttpResponse
         HttpResponse response = http.send(request);
 
         //4.Process the response
         if (response.getStatusCode() == 200){
            String jsonString = response.getBody();
            //Convert json string into wrapper
            List<CovidWrapper> CovWrapper = (List<CovidWrapper>)JSON.deserialize(jsonString, List<CovidWrapper>.class);
            CovidWrapper Wrapper = CovWrapper[0];
         
            List<Covid_Info__c> cov = [SELECT ID, Name, Positive__c, Negative__c, Pending__c FROM Covid_Info__c WHERE Received_Date__c = TODAY ];
            if (!cov.isEmpty()) {
                cov[0].Name = string.valueOf(Wrapper.states);
                cov[0].Positive__c= Wrapper.positive;
                cov[0].Negative__c= Wrapper.negative;
                cov[0].Pending__c= Wrapper.pending;
                update cov[0];
                
            } else {
                Covid_Info__c CovidName = new Covid_Info__c();
                CovidName.Name = string.valueOf(Wrapper.states);
                CovidName.Positive__c= Wrapper.positive;
                CovidName.Negative__c= Wrapper.negative;
                CovidName.Pending__c= Wrapper.pending;
                CovidName.Received_Date__c= date.today();
                insert CovidName;
               
            }

         }
         System.debug(response.getStatus());
         System.debug(response.getStatusCode());
         System.debug(response.getBody());
         return response;

        
    }

    //Endpoint: https://gorest.co.in/public/v2/posts
    //Http Methodd :POST
    public static HttpResponse postCovid() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/posts');
        request.setMethod('POST');
        //set json body
        Posts__c record = [SELECT Id, Name, Title__c, User_id__c, Body__c FROM Posts__c WHERE  CreatedDate = TODAY LIMIT 1 ];
        PostWrapper wrapper = new PostWrapper();
        wrapper.user_id= User_id__c;
        wrapper.title= Title__c;
        wrapper.body= Body__c;
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

    }
}