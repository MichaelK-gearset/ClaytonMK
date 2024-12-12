trigger testEventTrigger on Test_Event__e (after insert) {    
    // List to hold all cases to be created.
    List<Case> cases = new List<Case>();
    
    // Get user Id for case owner. Replace username value with a valid value.
    User adminUser = [SELECT Id FROM User WHERE Username='admin@acme.org'];
   
    // Insert all cases in the list.
    if (cases.size() > 0) {
        insert cases;
    }
}