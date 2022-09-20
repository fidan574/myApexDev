try{
    Account ac = new account();
    insert ac;

 } catch(DMLException dex){
        System.debug('DML went wrong buddy!');
    
} catch (Exception ex){
    system.debug('Somthing went wrong buddy!');
}

system.debug('Apex is simple');