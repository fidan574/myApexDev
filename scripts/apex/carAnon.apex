Car bm = new Car();
bm.carColor = 'Black';
bm.switchOn();
system.debug(bm);

Car lm = new Car();
lm.carColor = 'Red';
lm.switchOn();
//lm.MaxSpeedKmPerHr = 150
system.debug(lm);

Car vm = new Car();
vm.carColor = 'White';
vm.carName = 'Polo';
vm.switchOn();
vm.drive();
vm.driveAtMaxSpeed();
system.debug(vm);