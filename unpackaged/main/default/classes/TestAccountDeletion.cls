@isTest
private class TestAccountDeletion {
  @isTest
  static void TestDeleteAccountWithOneOpportunity() {
    // Test data setup
    // Create one account with one opportunity by calling a utility method
    Account[] accts = TestDataFactory.createAccountsWithOpps(1,1);
    // Perform test
    Test.startTest();
      Database.DeleteResult result = Database.delete(accts[0], false);
    Test.stopTest();
    // Verify that the deletion should have been stopped by the trigger,
    // so check that we got back an error.
    System.assert(!result.isSuccess(), 'Assert that the result is not success.');
    System.assert(result.getErrors().size() > 0, 'Assert that there are no errors in the result');
    System.assertEquals('Cannot delete account with related opportunities.',
      result.getErrors()[0].getMessage(), 'This method will assert that there is no error when deleting account with opportunities.');
  }
  @isTest
  static void TestDeleteAccountWithNoOpportunities() {
    // Test data setup
    // Create one account with no opportunities by calling a utility method
    Account[] accts = TestDataFactory.createAccountsWithOpps(1,0);
    // Perform test
    Test.startTest();
      Database.DeleteResult result = Database.delete(accts[0], false);
    Test.stopTest();
    // Verify that the deletion was successful
    System.assert(result.isSuccess(), 'Assert that the result is a success.');
  }
  @isTest
  static void TestDeleteBulkAccountsWithOneOpportunity() {
    // Test data setup
    // Create accounts with one opportunity each by calling a utility method
    Account[] accts = TestDataFactory.createAccountsWithOpps(200,1);
    // Perform test
    Test.startTest();
      Database.DeleteResult[] results = Database.delete(accts, false);
    Test.stopTest();
    // Verify for each record.
    // In this case the deletion should have been stopped by the trigger,
    // so check that we got back an error.
    for(Database.DeleteResult dr : results) {
      System.assert(!dr.isSuccess(), 'Assert that the result of the operation is not success.');
      System.assert(dr.getErrors().size() > 0, 'Assert that there are no errors in the database.');
      System.assertEquals('Cannot delete account with related opportunities.',
        dr.getErrors()[0].getMessage(), 'This method will assert that there is no error when deleting a related opportunities.');
    }
  }
  @isTest
  static void TestDeleteBulkAccountsWithNoOpportunities() {
    // Test data setup
    // Create accounts with no opportunities by calling a utility method
    Account[] accts = TestDataFactory.createAccountsWithOpps(200,0);
    // Perform test
    Test.startTest();
      Database.DeleteResult[] results = Database.delete(accts, false);
    Test.stopTest();
    // For each record, verify that the deletion was successful
    for(Database.DeleteResult dr : results) {
      System.assert(dr.isSuccess(), 'Assert that the result of the operation is true.');
    }
  }
}