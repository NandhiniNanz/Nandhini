trigger Quotee on Candidate__c (before insert, before Update) 
{
    List<Candidate__c> can = trigger.new;
    Quote Qt= new Quote();
    Qt.addQuote(can);

}