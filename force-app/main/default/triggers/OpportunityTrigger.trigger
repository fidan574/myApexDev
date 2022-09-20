trigger OpportunityTrigger on Opportunity (before insert) {
 if (trigger.isBefore &&trigger.isUpdate){
    for(Opportunity op : trigger.new){
        // if(trigger.oldMap.get(op.id).stageName == 'Close Won'){
        //     op.addError('degistiremezsiniz...');
        }
        if(op.stageName != trigger.oldMap.get(op.id).stageName){
            if(op.StageName == 'Closed Lost'){
                op.Description = 'Cok uzgunuz...';

            }
            if(op.StageName == 'Closed Won'){
                op.Description = 'Yasasin...';

            }
            if(op.StageName == 'Prospecting'){
                op.addError('Sureci basa donduremezsiniz...');

            }
            
        }
    }
 }
