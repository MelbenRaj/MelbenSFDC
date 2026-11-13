public class accountTriggerHandler {
//  Updated using feature branch
    public static void updateDescription(List<account>listOfAccount,Map<Id,Account>mapOfAccount)
    {
        for(account acc : listOfAccount)
        {
            If(acc.Phone != mapOfAccount.get(acc.Id).phone){
             
                acc.Description=mapOfAccount.get(acc.Id).phone;
            }
        }
        
    }
    public static void createContact(List<Account>accountList){
      Set<Id> accountIds = new Set<Id>();
    for (Account acc : accountList) {
        if (acc.Rating == 'Hot') {
            accountIds.add(acc.Id);
        }
    }

    // Query all contacts related to the accounts with 'Hot' rating
    Map<Id, Contact> accountContactMap = new Map<Id, Contact>();
    if (!accountIds.isEmpty()) {
        for (Contact con : [SELECT Id, LastName, AccountId FROM Contact WHERE AccountId IN :accountIds ORDER BY CreatedDate DESC]) {
            // Only store the first contact for each account (most recent one)
            if (!accountContactMap.containsKey(con.AccountId)) {
                accountContactMap.put(con.AccountId, con);
            }
        }
    }

    // List to hold the updated accounts
    List<Account> accList = new List<Account>();

    // Update accounts based on the retrieved contacts
    for (Account acc : accountList) {
        if (acc.Rating == 'Hot' && accountContactMap.containsKey(acc.Id)) {
            Contact con = accountContactMap.get(acc.Id);
            acc.Description = con.LastName;
            accList.add(acc);
        }
    }

    // Update the modified accounts
    if (!accList.isEmpty()) {
        update accList;
    }
}
    public static void oppUpdate(List<Account>acclist){
        
        set <Id> accId = new  set <Id>();
        for(Account acc : acclist){
            
            accId.add(acc.Id);
        }
        
        
    }
}