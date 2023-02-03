public class Cat {
    public string name;
    public string color;
    public Cat() {
        system.debug('cat constructor called,okay?');

    }

    //parameterized constractor
    public Cat(string n, string clr){
        name=n;
        color=clr;

      
    }
    public cat(string n){
        name= n;
            
    }
    public void sleeping(){
        system.debug(name+ 'is sleeping');
    }
}