trigger Createdept on University__c (after insert) {
    list<Departments__c> listdp = new list<Departments__c>();
    for(University__c Univ : trigger.new)
    {
        Departments__c dept = new Departments__c();
        dept.University__c=Univ.id;
        dept.Name='Fashion';
        listdp.add(dept);
        
    }
insert listdp;
}