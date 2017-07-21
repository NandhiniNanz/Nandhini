public class StringArrayTest {
    public static List<String> generateStringArray(Integer n)
    {
        List<String> lststring = new List<String>();
        for(Integer i=0; i<n; i++)
        {
            lststring.add('Test ' +i);
            System.debug(lststring[i]);
       }
        return lststring;
    }

}