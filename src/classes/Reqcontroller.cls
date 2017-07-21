public class Reqcontroller {
    Public list<Requirement__c> listreq {get;set;}
    Public void fetchrecord()
    {
    listreq = [Select name,Type__c from Requirement__c];
    system.debug(+ 'listreq');
    }
    
    }