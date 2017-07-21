public class customsetting
{
    public List<CountryCodes__c> code {get;set;}
   
    public customsetting()
    {
        Map<String,CountryCodes__c> allCodes = CountryCodes__c.getAll();
        code = allCodes.values();
    }  
   
}