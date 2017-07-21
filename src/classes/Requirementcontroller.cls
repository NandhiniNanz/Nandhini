public class Requirementcontroller {
    public string searchtext{get;set;}
    public Boolean isshowrec{get;set;}
    Public list<Requirement__c> listreq {get;set;}
    Public void search()
    {
        if(searchtext == '')
        {
            listreq = [Select name,Type__c from Requirement__c  ];
        }
        else
        {
            listreq = [Select name,Type__c from Requirement__c where name=:searchtext  ];
        }
        
        if(listreq.size()>0)
        {
            isshowrec=true;
        }
    }
    
}