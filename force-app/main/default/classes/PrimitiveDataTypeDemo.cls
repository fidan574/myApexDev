public class PrimitiveDataTypeDemo {
    public void printBasicDataType() {
                string batchName = 'Falcons8';
                integer totalCandidates = 40;
                boolean isAdminComplated = true;

                system.debug(batchName);
                system.debug(totalCandidates);
                system.debug(isAdminComplated);
                
                string batchDescription = batchName + 'are the BESTEST';
                system.debug(BatchDescription);
    }

    public void printBasicDataType2() {
        Decimal decValue = 279.01;
        system.debug('Decimal= ' + decValue);   //decimal
        
        Long logValue = 234567654344L;
        system.debug('Long value = ' + logValue);

        ID id1 = '0017Q00000NtJbLQAV';
        system.debug('Id is ' + id1);

}
}

