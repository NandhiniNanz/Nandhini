global class scheduleLead implements schedulable
{
    global void execute(SchedulableContext sc)
    {
    BatchLeadDelete b=new BatchLeadDelete();
database.Executebatch(new BatchLeadDelete(),200);

    }
}