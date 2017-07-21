public class SearchRecords {


    public string getstring{get;set;}
    public string setstatus{get;set;}
    public List<account>createFriendList {get;set;}

    public void searchRecords(){
        createFriendList= new list<account>();
        if(getstring!=null){
            createFriendList= Database.query('select id,name,comments__c from account LIMIT 21');                    
        }
    }

}