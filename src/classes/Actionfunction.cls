public class Actionfunction{
    public List<SelectOption> Alphabets {get; set;}
    public List<SelectOption> Fruits {get; set;}
   
    public String SelectedAlphabet {get; set;}
   
    
    public Actionfunction(){
        Alphabets = new List<SelectOption>();
        Fruits    = new List<SelectOption>();
       
        
        SelectOption option = new SelectOption('--None--', '--None--');
        Alphabets.add(option);
        Fruits.add(option);
       
        option = new SelectOption('A', 'A');
        Alphabets.add(option);
       
        option = new SelectOption('B', 'B');
        Alphabets.add(option);       
    }
   
  
    public void createFruitList(){
       
        Fruits.clear();
       
        Fruits.add(new SelectOption('--None--', 'None'));
       
        if(SelectedAlphabet == 'A'){
            Fruits.add(new SelectOption('Apple','Apple'));
            Fruits.add(new SelectOption('Apricot','Apricot'));
        }
        else if(SelectedAlphabet == 'B'){
            Fruits.add(new SelectOption('Banana','Banana'));
            Fruits.add(new SelectOption('Blackberry','Blackberry'));
        }
    }
}