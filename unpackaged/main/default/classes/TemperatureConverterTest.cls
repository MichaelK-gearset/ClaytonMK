@isTest
private class TemperatureConverterTest {
  @isTest static void testWarmTemp() {
    Decimal celsius = TemperatureConverter.FahrenheitToCelsius(70);
    System.assertEquals(21.11,celsius, 'Checks that the Celsius version is equal to 21. 11.');
  }
  @isTest static void testFreezingPoint() {
    Decimal celsius = TemperatureConverter.FahrenheitToCelsius(32);
    System.assertEquals(0,celsius, 'Checks that all values are 0 and celsius.');
  }
  @isTest static void testBoilingPoint() {
    Decimal celsius = TemperatureConverter.FahrenheitToCelsius(212);
    System.assertEquals(100,celsius,'Boiling point temperature is not expected.');
  }
  @isTest static void testNegativeTemp() {
    Decimal celsius = TemperatureConverter.FahrenheitToCelsius(-10);
    System.assertEquals(-23.33,celsius, 'Checks that the value of the constant is equal to the value of the constant celsius');
  }
}