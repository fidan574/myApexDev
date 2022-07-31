public class Car {
    public string carColor = '';
    Public string carName = '';
    integer maxSpeedKmPerHr = 150;
    
    public void switchOn(){ 
        //method body
        system.debug('starting the car');
    }
    public void drive(){
        system.debug('driving '+ carName);
    }
    public void driveAtMaxSpeed(){
        string drivingDescription = 'driving ' + carName + ' at ' + maxSpeedKmPerHr + 'km/h';
        system.debug(drivingDescription);
    }
 }
 