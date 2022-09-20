Account acc = [SELECT id, Name, OwnerId, CreatedBy.Name FROM Account Where Industry='BioTechnology' LIMIT 1];
system.debug(acc.Id);
Map<String,Object> inputs = new Map<String,Object>();
inputs.put('AccountId', acc.Id);
inputs.put('AccountName', acc.Name);
inputs.put('AccountOwnerId', acc.OwnerId);
inputs.put('CreatedByName', acc.CreatedBy.Name);
Flow.Interview flow = new Flow.Interview.Account_Auto_Launched_Flow_Create_Task_Update_Industry_Biotechology(inputs);
flow.start();