@isTest
public class PassingTests {

    @isTest static void test1() {
         System.assertEquals(1, 1, 'Checks that 1 and 1 are equal.');
    }
    
    @isTest static void test2() {
        System.assertEquals(2, 2, 'Test for equality of 2 and 2.');
    }
}