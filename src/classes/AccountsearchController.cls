public class AccountsearchController {

    public PageReference searchtext() {
        return null;
    }


    public String searchtext{get;set;}
        public Boolean isshowrec{get;set;}
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
        
        if(listacc.size()>0)
        {
            isshowrec=true;
        }
    }
    
}