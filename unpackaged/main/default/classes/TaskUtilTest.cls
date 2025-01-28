@isTest
private class TaskUtilTest {
  @isTest
  static void testTaskPriority() {
    String pri = TaskUtil.getTaskPriority('NY');
    System.assertEquals('Normal', pri, 'assertEquals - Asserts that pri is equal to normal.');
  }
  @isTest
  static void testTaskHighPriority() {
    String pri = TaskUtil.getTaskPriority('CA');
    System.assertEquals('High', pri, 'Checks that pri is equal to high.');
  }
  @isTest
  static void testTaskPriorityInvalid() {
    String pri = TaskUtil.getTaskPriority('Montana');
    System.assertEquals(null, pri, 'Assert that pri is null.');
  }
}