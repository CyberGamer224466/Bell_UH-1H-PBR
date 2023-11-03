# Simple vibrating yawstring

var yawstring = func {

	var airspeed = getprop("velocities/airspeed-kt");
	var rpm = getprop("/rotors/main/rpm");
        var severity = 0;	
        if  (( airspeed < 137) and (rpm >170))
	{
         severity = ( math.sin (  math.pi * airspeed/137 ) * (rand()*12) ) ;
        }
	var position = getprop("orientation/side-slip-deg") + severity ;

	setprop("instrumentation/yawstring",position);
	
	settimer(yawstring,0);

}

# Start the yawstring ASAP
yawstring();
