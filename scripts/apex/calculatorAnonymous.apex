Calculator calc = new Calculator();
calc.printNewMessage('This is new age calc.');
calc.printNewMessage('This is new age calc. Really new.');
string message = 'This is a new message to print.';
calc.printNewMessage(message);
calc.add(5, 10);
calc.add(50, 100);
integer x = 25;
integer b = 80;
calc.add(x, b);
calc.add(x, 97);
String result = calc.printAndReturnMessage('This is a parameter');
system.debug(result);

date d = date.today();
boolean lpcheck = calc.leapYearCheck(d);
system.debug('Today date leap year check: ' + lpcheck);


date d2 = date.newInstance(2024, 2, 2);
boolean lpcheck2 = calc.leapYearCheck(d2);
system.debug('2024 date leap year check: ' + lpcheck2);


