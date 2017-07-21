@istest
Public class Createdepttest
{
Public Static testmethod void depttest()
{
University__c univ=new University__c();
univ.Name='DCE';
insert univ;
Departments__c dept = new Departments__c();
dept.Name='Fashion';
dept.University__c=univ.Id;

insert dept;
}
}