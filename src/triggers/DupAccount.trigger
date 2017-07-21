trigger DupAccount on Account (before insert, before Update) {
    for(Account acct: trigger.new) 
    {
        list<Account> acc =[SELECT id from Account WHERE Name=:acct.Name];
            if(acc.size()>0)
        {
          acct.Name.addError('Cannot Create the Account');     
            }
    }

}