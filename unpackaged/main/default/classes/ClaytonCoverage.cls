public class ClaytonCoverage {
    
    // Simple method to perform some operations
    public static void performOperations() {
        Integer x = 5;
        Integer y = 10;
        Integer result = x + y;
    }
    
    // Method to determine if a value is positive
    public static Boolean isPositive(Integer value) {
        return value > 0;
    }

    // Method that fetches sensitive data without enforcing sharing rules
    public static List<Account> getAllAccounts() {
        // Because no sharing is declared, this method runs with full access to Account records, potentially exposing sensitive data
        return [SELECT Id, Name FROM Account];
    }

    // New method that is never tested to trigger the violation
    public static Boolean isNegative(Integer value) {
        return value < 0;
    }
}