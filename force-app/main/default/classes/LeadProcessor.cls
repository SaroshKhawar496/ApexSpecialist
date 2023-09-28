public class LeadProcessor implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }
    public void execute(Database.BatchableContext bc, List<Lead> processLeads){
        List<Lead> updateLeads = new List<Lead>();
        for(Lead l: processLeads){
            l.LeadSource = 'Dreamforce';
            updateLeads.add(l);
        }
        update updateLeads;
    }
    public void finish(Database.BatchableContext bc){

    }
}