public class accountType {

     public String type { get; set; }
        Public list<Account> listacc {get;set;}
       

 Public void type()
        {
        if(type=='None')
                {
            listacc = [Select id,name,type from Account];
        }
        else
        {
            listacc = [Select id,name,type from Account where Type=:type];
        }
        


}
   
}