@IsTest
public class OpportunityAlertControllerTest {

    @IsTest
    public static void testGetOpptyWithoutOpenTasks() {

        Opportunity oppty = new Opportunity(
            Name = 'Test Oppty',
            CloseDate = Date.today(),
            StageName = 'Prospecting'
        );
        insert oppty;

        Task tsk = new Task(
            Subject = 'Test Task',
            WhatId = oppty.Id,
            Status = 'Completed'
        );
        insert tsk;

        List<Opportunity> opps;

        opps = OpportunityAlertController.getOpportunities(0, 'Prospecting', false);
        System.assertEquals( 1, opps.size(), 'Assert that the number of opps is equal to 1.' );

        opps = OpportunityAlertController.getOpportunities(0, 'Prospecting', true);
        System.assertEquals( 0, opps.size(), 'Assert that the opps list is empty.' );

    }

    @IsTest
    public static void testGetOpptyWithOpenTasks() {

        Opportunity oppty = new Opportunity(
            Name = 'Test Oppty',
            CloseDate = Date.today(),
            StageName = 'Prospecting'
        );
        insert oppty;

        Task tsk = new Task(
            Subject = 'Test Task',
            WhatId = oppty.Id,
            Status = 'Not Started'
        );
        insert tsk;

        List<Opportunity> opps;

        opps = OpportunityAlertController.getOpportunities(0, 'Prospecting', false);
        System.assertEquals( 1, opps.size(), 'Assert that the number of opps is equal to 1.' );

        opps = OpportunityAlertController.getOpportunities(0, 'Prospecting', true);
        System.assertEquals( 1, opps.size(), 'Assert that the number of opps is equal to 1.' );

    }

}