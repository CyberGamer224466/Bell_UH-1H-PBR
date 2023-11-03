# =====
# Doors
# =====

Doors = {};

Doors.new = func {
   obj = { parents : [Doors],
        
		   gunsight : aircraft.door.new("instrumentation/doors/gunsight", 2.0)
           
         };
   return obj;
};


Doors.gunsightexport = func {
   me.gunsight.toggle();
}

# ==============
# Initialization
# ==============

# objects must be here, otherwise local to init()
doorsystem = Doors.new();

