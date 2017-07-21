public class DropDown
{

 public DropDown()
    {
     
    }
 
    public List<SelectOption> getdynamiclist() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Sample','Sample'));
        options.add(new SelectOption('Test','Test'));
        options.add(new SelectOption('Example','Example'));
        return options;
    }
 
}