@isTest
public class TestRestrictContactByName {

    @isTest
    static void testBeforeInsertWithInvalidName() {
        // Create a contact with an invalid last name
        Contact contact = new Contact(FirstName = 'John', LastName = 'INVALIDNAME');

        Test.startTest();
        // Try to insert the contact and expect an exception
        try {
            insert contact;
            System.assert(false, 'Expected an exception to be thrown due to invalid last name.');
        } catch (DmlException e) {
            // Check that the correct error message is included in the exception
            System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'), 'Unexpected error message: ' + e.getMessage());
        }
        Test.stopTest();
    }

    @isTest
    static void testBeforeInsertWithValidName() {
        // Create a contact with a valid last name
        Contact contact = new Contact(FirstName = 'John', LastName = 'VALIDNAME');

        Test.startTest();
        // Insert the contact without any exception
        insert contact;
        Test.stopTest();

        // Verify the contact was inserted correctly
        Contact insertedContact = [SELECT Id, LastName FROM Contact WHERE Id = :contact.Id];
        System.assertEquals('VALIDNAME', insertedContact.LastName, 'The contact was not inserted with the expected last name.');
    }

    @isTest
    static void testBeforeUpdateWithInvalidName() {
        // Create and insert a valid contact
        Contact contact = new Contact(FirstName = 'Jane', LastName = 'VALIDNAME');
        insert contact;

        // Update the contact with an invalid last name
        contact.LastName = 'INVALIDNAME';

        Test.startTest();
        // Try to update the contact and expect an exception
        try {
            update contact;
            System.assert(false, 'Expected an exception to be thrown due to invalid last name.');
        } catch (DmlException e) {
            // Check that the correct error message is included in the exception
            System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'), 'Unexpected error message: ' + e.getMessage());
        }
        Test.stopTest();
    }

    @isTest
    static void testBeforeUpdateWithValidName() {
        // Create and insert a valid contact
        Contact contact = new Contact(FirstName = 'Jane', LastName = 'VALIDNAME');
        insert contact;

        // Update the contact with another valid last name
        contact.LastName = 'NEWVALIDNAME';

        Test.startTest();
        // Update the contact without any exception
        update contact;
        Test.stopTest();

        // Verify the contact was updated correctly
        Contact updatedContact = [SELECT Id, LastName FROM Contact WHERE Id = :contact.Id];
        System.assertEquals('NEWVALIDNAME', updatedContact.LastName, 'The contact was not updated with the expected last name.');
    }
}