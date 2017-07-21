public class Searchaccountcontroller {
public PageReference Searchtext() {
        return null;
    }
 public String searchtext{get;set;}
        
    Public list<Account> listacc {get;set;}
    Public void search()
    {
        if(searchtext == '')
        {
            listacc = [Select id,name from Account];
        }
        else
        {
            listacc = [Select id,name from Account where name=:searchtext  ];
        }
        
        
    }
    
}