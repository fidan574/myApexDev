public class classExampleTest {
    public static integer numberType(integer a){
        if(a<0){
            a = a + 100;
            system.debug('sayi kucuk sifirdan.');
        }else if(a>0){
            a = a + 50;
            system.debug('sayi buyuk sifirdan.');
        }else{
            a = a + 75;
            system.debug('sayi sifira esit.');
        }
        return a;
    }
}
