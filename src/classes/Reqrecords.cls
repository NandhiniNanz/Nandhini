public class Reqrecords {

    public PageReference search() {
        return null;
    }


    public String searchtext { get; set; }
    Public list<Requirement__c> listreq {get;set;}
    Public list<Requirement__c> getrecords()
    {
        listreq = [Select name,Type__c from Requirement__c];
        return listreq;
    }
    public pagereference redirectToVfpage()
    {
        pagereference pg = new pagereference('/apex/RecordPage');
        return pg;
    }
}