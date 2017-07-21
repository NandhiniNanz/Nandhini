@isTest
public class TemperatureTest 
{
    Private static testmethod void testWarmTemp()
    {
        Decimal celsius= Temperature.FarenhiettoCelsius(70);
        System.AssertEquals(21.11,celsius);
    }
    Private Static testmethod void testfreezingpoint()
    {
        Decimal celsius=Temperature.FarenhiettoCelsius(32);
        System.AssertEquals(0,celsius);
    }
}