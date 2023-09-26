trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    //adds a follow-up task to an opportunity if its stage is Closed Won
    List<Opportunity> closedWonOpps = [SELECT Id, Name FROM Opportunity WHERE StageName = 'Closed Won' AND ID IN: Trigger.new];
    List<Task> newTasks = new List<Task>();
    for(Opportunity opp: closedWonOpps){
        Task t = new Task();
        t.Subject = 'Follow Up Test Task';
        t.WhatId = opp.Id;
        newTasks.add(t);
    }
    insert newTasks;
}