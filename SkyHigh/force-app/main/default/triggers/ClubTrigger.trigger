trigger ClubTrigger on Club__c (before insert, before update, before delete) {

    if(Trigger.isBefore){
        if(Trigger.isDelete){
            List<Club__c> c = Trigger.old;
            ClubHelperMethods.deleteClass(c);
        }
    }
    

}