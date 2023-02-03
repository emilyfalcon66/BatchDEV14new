public class Car {
    //variable created directly in class are class variables.
    //class variablee can have access modifier
    public string carColor= '';
    public string carName;

    //defalt is private
    integer maxSpeed =140;
    
    


    public void switchOn(){
        system.debug('starting the car now');
    }

    public void drive(){
        system.debug('driving '+  carName);
    }

    public void driveAtMaxSpeed(){
string description= 'driving' + carName+  ' with car color ' + carColor+ 'at ' + maxSpeed + 'km/h';
system.debug(description);

    }
    
}