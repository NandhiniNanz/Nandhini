public class Dropdowncontroller {

    public Dropdowncontroller(ApexPages.StandardController controller) {

    }

    public string selectedvalue{get;set;}
    Public list<Opportunity> listopp {get;set;}
    Public list<selectOption> StageName {get;set;}
    Public void search()
    {
    listopp =[select name,Type,Amount from Opportunity where StageName=:selectedvalue];
    }
    }