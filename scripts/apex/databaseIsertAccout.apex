list<account> listAcc = new list<account>();
            account a3 = new account();
            a3.name = 'PI Test1';
            a3.Industry = 'Banking';
            a3.Type = 'Customer - Direct';
            listAcc.add(a3);

            account a1 = new account();
            a1.name = 'PI Test';
            a1.Industry = 'Banking';
            a1.Type = 'Customer - Direct';
            listAcc.add(a1);

            account a3x = new account();
            listAcc.add(a3x);
            account a3y = new account();
            listAcc.add(a3y);

            list<database.SaveResult> results = Database.insert(listAcc, false);
            system.debug('***results==>' + results);
            for(database.SaveResult eachResult : results){
                if(eachResult.isSuccess()){
                    system.debug('Account inserted. Good Guy. Id is ' + eachResult.getId());
                }else{
                    System.debug('Errors:' + eachResult.getErrors());
                }
            }





