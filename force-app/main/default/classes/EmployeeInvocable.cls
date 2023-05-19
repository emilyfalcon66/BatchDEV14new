public with sharing class EmployeeInvocable {

    @InvocableMethod(label = 'Send Employee Information'
                     description= 'Post the newly created employee recordds into vendor system'
                     category = 'Employee')
    public static void sendEmployees(List<Id>employeeIds) {
        for(Id employeeId : employeeIds ){
            PostCallOut.postMethod(employeeId);
        }
    }
}