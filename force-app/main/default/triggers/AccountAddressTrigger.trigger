trigger AccountAddressTrigger on Account (before insert, before update ) {
    for(Account acc: Trigger.new){
            /* 
            sets an account’s Shipping Postal Code to match the Billing Postal Code
            if the Match Billing Address option is selected
            */
        if(acc.Match_Billing_Address__c){
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }
}