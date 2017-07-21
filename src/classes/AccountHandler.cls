public class AccountHandler {

    public static Account insertNewAccount(string Name)
    {
        Account acct = new Account();
        acct.Name= name;
            try
            {
                insert acct;
            }
        catch(DmlException e)
        {
            return null;
            
        }
        return acct;
                
            
               
        }
}