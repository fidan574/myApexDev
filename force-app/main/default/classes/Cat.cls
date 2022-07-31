public class Cat {
    public String name = '';
    public string color = '';
    public Cat() {
        system.debug('constractor is called');
    }

    public Cat(string nm, string clr){
        name = nm;
        color = clr;
        sleeping();
    }
    public void sleeping(){
        system.debug(name + ' is sleeping');
    }
}
