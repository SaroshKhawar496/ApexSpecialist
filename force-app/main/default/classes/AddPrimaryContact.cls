public class AddPrimaryContact implements Queueable {
    private Contact primaryCon;
    private String stateAbbr;
    
    public AddPrimaryContact(Contact ct, String state) {
        this.primaryCon = ct;
        this.stateAbbr = state;
    }
    public void execute(QueueableContext qc){
        List<Contact> newCons = new List<Contact>();
        for(Account acc: [SELECT Id FROM Account WHERE BillingState =: this.stateAbbr LIMIT 200]){
            Contact ct = primaryCon.clone(false,false,false,false);
            ct.AccountId = acc.Id;
            newCons.add(ct);
        }
        insert newCons;
    }
}