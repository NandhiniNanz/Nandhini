Global class BatchDeleteacc Implements Database.batchable<sobject>{
     global final string query;
     global BatchDeleteacc(string q){
         
          query=q;
     }
   
     global Database.QueryLocator start(Database.BatchableContext BC){

      return Database.getQueryLocator(query);
     }
     global  void execute(Database.BatchableContext BC,List<SObject> scope){
         delete scope;
    
    }
    global void finish(Database.BatchableContext BC){
    }

 }