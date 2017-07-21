@istest
Public class testcreatedept
{
Public static testmethod void createdept()
{
University__c univ= new University__c();
univ.Name='DCE';
insert univ;
List<Departments__c> dept = [Select id,Name from Departments__c where Name=:Univ.Name];
system.AssertEquals('DCE',dept[10].Name);

        }
        }