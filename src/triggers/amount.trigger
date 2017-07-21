trigger amount on Opportunity (before insert,before update) {
    for (Opportunity opp: trigger.new){
        if(trigger.isInsert && opp.amount > 5000)
            opp.addError('Amount cannot be les than 5000');
                else 
            if(trigger.isUpdate && opp.amount < 3000)
            opp.addError('Amount cannot be less than 3000');
    }

}