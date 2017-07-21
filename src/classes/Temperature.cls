public class Temperature 
{
    Public static Decimal FarenhiettoCelsius(Decimal fh)
    {
        Decimal cs =(fh -32) * 5/9;
        return cs.setscale(2);
        
    }

}