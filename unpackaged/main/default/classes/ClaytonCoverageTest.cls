@IsTest
public class ClaytonCoverageTest {

    // Missing @IsTest annotation in the method
    public static void testPerformOperations() {
        ClaytonCoverage.performOperations();
        // Missing assertions and comments explaining the purpose of the test
    }

    // Using SeeAllData=true but also inserting a manual record to avoid using a data factory
    @IsTest(SeeAllData=true)  // Allowing access to real org data, triggering full-data access violation
    public static void testIsPositive() {
        // Accessing real org data by querying without test isolation
        List<Account> realAccounts = [SELECT Id, Name FROM Account LIMIT 1];
        
        Account acc;
        if (realAccounts.size() > 0) {
            acc = realAccounts[0];  // Using real data if available
        } else {
            // Inserting a new Account manually
            acc = new Account(Name = 'Test Account');
            insert acc;
        }

        // Full data access violation - using real org data in a test
        // Still manually inserting required Contact
        Contact primaryContact = new Contact(LastName = 'Test Contact');
        insert primaryContact;

        // Simulating the requirement to populate the Primary_Contact__c field on the Account
        acc.Primary_Contact__c = primaryContact.Id;
        update acc;

        Integer positiveNumber = 1;
        Boolean result = ClaytonCoverage.isPositive(positiveNumber);
        
        // Insufficient number of assertions
        System.assert(result);
    }

    // Dummy test method that doesn't test any logic but increases coverage
    @IsTest
    public static void testDummyCoverage() {
        ClaytonCoverage.performOperations(); // No meaningful test
        // Missing any form of assertions and completely dummy method
    }

    // Test method for getAllAccounts with improper data isolation
    @IsTest
    public static void testGetAllAccounts() {
        List<Account> accounts = ClaytonCoverage.getAllAccounts();
        // Missing assertion or meaningful validation
        System.debug(accounts.size());  // This only outputs data, without validating it
    }

    // Intentionally leaving out a test for ClaytonCoverage.isNegative() to trigger the "Untested Apex method" violation.
}