global class BatchLeadDelete implements Database.Batchable<sObject>
{
 
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        string strStatus = 'Dead';
        return Database.getQueryLocator('SELECT  id,FirstName, LastName FROM Lead WHERE Status=:strStatus');
    }
     
    global void execute(Database.BatchableContext BC,List<Lead> scope)
    {
    
  
        
      
        Delete scope;
    }

        
    
     
    global void finish(Database.BatchableContext BC)
    {
      
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'nandhini_a@preludesys.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Apex Batch Job');
        mail.setPlainTextBody('Completion Of Batch Apex ');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}