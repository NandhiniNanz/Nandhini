@istest
Public class createdepttest2
{
public static testmethod void dept()
{
University__c univ = new University__c();
univ.Name='MS';
insert univ;
univ= [Select id,Name from University__c where Name=:univ.Name];
System.AssertEquals(univ.Name,'MS');
}
}