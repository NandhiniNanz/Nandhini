public with sharing class ContactsListController {

    
public List<Contact> getContacts() 
{
    
    List<Contact> results = [SELECT Id, FirstName, LastName, Title, Email FROM Contact LIMIT 10];
       return results;
}
}