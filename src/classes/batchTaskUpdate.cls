global class batchTaskUpdate implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
    
        String query = 'SELECT ActivityDate,Status FROM Task';
        return Database.getQueryLocator(query);
    }
   
    global void execute(Database.BatchableContext BC, List<Task> scope)
    {
         for(Task a : scope)
         {   
             
             a.Status = 'Completed';            
         }
         update scope;
    }   
    global void finish(Database.BatchableContext BC)
    {
    }
}