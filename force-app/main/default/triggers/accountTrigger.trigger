trigger accountTrigger on Account (before update,after update) {

    If(trigger.isupdate)
    {     
    If(trigger.isbefore)
    {
        accountTriggerHandler.updateDescription(trigger.new,Trigger.oldMap);
     }
          If(trigger.isafter)
    {
        accountTriggerHandler.createContact(trigger.new);
        accountTriggerHandler.oppUpdate(trigger.new);
     }
    }
}