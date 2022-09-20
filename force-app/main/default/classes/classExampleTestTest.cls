@isTest
public class classExampleTestTest {
    @isTest
    private static void numberTypeTest() {
        integer sonuc1 = classExampleTest.numberType(3);
        integer sonuc2 = classExampleTest.numberType(-25);
        integer sonuc3 = classExampleTest.numberType(0);
        system.assertEquals(53,sonuc1);
        system.assertEquals(75,sonuc2);
        system.assertEquals(75,sonuc3);
}
}

