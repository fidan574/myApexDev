trigger AccountTrigger3 on Account (before insert, after insert, before update, after update) {
    system.debug('====Trigger START====');
    if(Trigger.isBefore && Trigger.isInsert){
        system.debug('Before INSERT trigger called. Yeahh...');
    }
    if(Trigger.isAfter && Trigger.isInsert){

        system.debug('After INSERT trigger called. Yeahh...');
    }  

    if(Trigger.isBefore && Trigger.isUpdate){
        system.debug('Before INSERT trigger called. Yeahh...');
    }
    if(Trigger.isAfter && Trigger.isUpdate){

        system.debug('After INSERT trigger called. Yeahh...');
    }  

     system.debug('====Trigger END====');


 } 
    
