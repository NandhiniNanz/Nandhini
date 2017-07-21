trigger testtrigger on Opportunity (before insert) {
    for (Opportunity opp: trigger.new){
        if(trigger.isInsert && opp.amount > 6000)
            insert opp;
         else 
            opp.addError('Amount cannot be les than 6000');
               
          
    }

}