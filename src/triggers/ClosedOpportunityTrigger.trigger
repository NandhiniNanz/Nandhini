trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) 
{
    List <Task> Listtask = new List <Task>();
    for (Opportunity opp :Trigger.new)
{
        if(Trigger.isInsert || Trigger.isUpdate) 
        {
            if(opp.StageName == 'Closed Won') 
            {
                Listtask.add(new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id));
            }
        }
    }
    if(Listtask.size()>0) 
{
        insert Listtask;

    }
}