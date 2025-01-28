@isTest
public class TestVerifyDate {
    
    @isTest
    static void testCheckDatesWithin30Days() {
        // Scenario 1: date2 is within 30 days of date1
        Date date1 = Date.today();
        Date date2 = date1.addDays(10); // within 30 days

        Date result = VerifyDate.CheckDates(date1, date2);

        // Since date2 is within 30 days of date1, it should return date2
        System.assertEquals(date2, result, 'Assert that date2 is equal to result.');
    }

    @isTest
    static void testCheckDatesOutside30Days() {
        // Scenario 2: date2 is outside 30 days of date1
        Date date1 = Date.today();
        Date date2 = date1.addDays(31); // outside 30 days

        Date result = VerifyDate.CheckDates(date1, date2);

        // Since date2 is outside 30 days of date1, it should return the end of the month of date1
        Date endOfMonth = Date.newInstance(date1.year(), date1.month(), Date.daysInMonth(date1.year(), date1.month()));
        System.assertEquals(endOfMonth, result, 'Assert that the end of the month is equal to the given result.');
    }

    @isTest
    static void testCheckDatesDate2InPast() {
        // Scenario 3: date2 is in the past relative to date1
        Date date1 = Date.today();
        Date date2 = date1.addDays(-10); // date2 is in the past

        Date result = VerifyDate.CheckDates(date1, date2);

        // Since date2 is in the past, it should return the end of the month of date1
        Date endOfMonth = Date.newInstance(date1.year(), date1.month(), Date.daysInMonth(date1.year(), date1.month()));
        System.assertEquals(endOfMonth, result, 'Assert that the end of the month is equal to the given result.');
    }
    
    @isTest
    static void testSetEndOfMonthDate() {
        // Scenario 4: Test SetEndOfMonthDate directly
        Date date1 = Date.newInstance(2024, 2, 15); // A date in February

        // Expected end of the month date for February 2024 (leap year)
        Date expectedEndOfMonth = Date.newInstance(2024, 2, 29);
    }
}