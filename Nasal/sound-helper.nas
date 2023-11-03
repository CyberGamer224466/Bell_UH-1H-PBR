var view_level_inside = props.globals.initNode("/sound/view-level-inside");
var view_level_outside = props.globals.initNode("/sound/view-level-outside");

var audio_level_doors = props.globals.initNode("/sound/outside-sound-lvl-doors");

var audio_level_doors = props.globals.initNode("/sound/outside-sound-lvl-doors-L");
var audio_level_doors = props.globals.initNode("/sound/outside-sound-lvl-doors-R");

setlistener("sim/current-view/internal", func{
		if(getprop("sim/current-view/internal")==1){
			view_level_inside.setValue(1.0);
			view_level_outside.setValue(0.0);
		}else{
			view_level_inside.setValue(0.0);
			view_level_outside.setValue(1.0);
		}
}, 1);


var setDoorAudioLvl = func(){
	var lvl0 = getprop( "/sim/model/bo105/doors/door/position-norm");
	var lvl1 = getprop( "/sim/model/bo105/doors/door[1]/position-norm");
	var lvl2 = getprop( "/sim/model/bo105/doors/door[2]/position-norm");
	var lvl3 = getprop( "/sim/model/bo105/doors/door[3]/position-norm");
	lvl = lvl0+lvl1+lvl2+lvl3;
	if(lvl>1)
		lvl=1;

	lvl_l = lvl1+lvl3;
	if(lvl_l>1) lvl_l=1;
	lvl_r = lvl0+lvl2;
	if(lvl_r>1) lvl_r=1;

	setprop("/sound/outside-sound-lvl-doors",lvl);

	setprop("/sound/outside-sound-lvl-doors-L",lvl_l);
	setprop("/sound/outside-sound-lvl-doors-R",lvl_r);
}

setlistener("/sim/model/bo105/doors/door/position-norm", func{
	setDoorAudioLvl();
}, 1);
setlistener("/sim/model/bo105/doors/door[1]/position-norm", func{
	setDoorAudioLvl();
}, 1);
setlistener("/sim/model/bo105/doors/door[2]/position-norm", func{
	setDoorAudioLvl();
}, 1);
setlistener("/sim/model/bo105/doors/door[3]/position-norm", func{
	setDoorAudioLvl();
}, 1);