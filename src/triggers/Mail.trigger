trigger Mail on Candidate__c (before insert, before update)
{
    set<string> setmail = new set<string>();
    set<string> setextmail = new set<string>();
    for(Candidate__c Can: trigger.new)
    {
        setmail.add(Can.E_Mail__c);
    }
    for(Candidate__c Can: [SELECT E_Mail__c from Candidate__c WHERE E_Mail__c IN:setmail])
    {
     setextmail.add(Can.E_Mail__c); 
    }
    if(trigger.isInsert || trigger.isUpdate)
        for(Candidate__c Can1: trigger.new)
        if(setextmail.contains(Can1.E_Mail__c))
    {
       Can1.E_Mail__c.addError('Existing'); 
    }
    
}