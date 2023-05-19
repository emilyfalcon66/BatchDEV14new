list<account> listAcc2 = [select id, name from account where name like '%--SI'];
AccountsQueueable2 aq2 = new AccountsQueueable2(listAcc2);
id jobId2 = system.enqueueJob(aq2);//we can enqueue the class which implements queueable.