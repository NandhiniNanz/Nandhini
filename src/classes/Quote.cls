public class Quote {
    public void addquote(List<Candidate__c> can){
        for(Candidate__c c:can)
        {
            if(c.Quote__c == Null)
            {
              c.Quote__c= 'All the Best' ; 
            }
            
        }
    }

}