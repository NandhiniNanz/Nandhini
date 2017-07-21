public class NewCaseListController{
public list<case> getNewCases()
{
list<case> lstcase = [SELECT CaseNumber FROM Case WHERE Status='New'];
return lstcase;
}
}