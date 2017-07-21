public class actionStatus {
    public Account account{get;set;}
    public actionStatus(){
        account = new Account();
    }
    public Pagereference save(){
        //upsert account;
        return null;
    }
}