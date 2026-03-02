#define Main

    Trace("Transparent trees go brrrr.");

#define OnSystemStep

with (objTree) {
    
    if (!variable_instance_exists(self, "hasDraw")) {
        
        self.hasDraw = false;
        
    }
    
    if (!hasDraw) {
        
        InstanceAssignMethod(self, "draw", ScriptWrap(DrawTree), false);
        hasDraw = true;
        
    }
    
}

#define DrawTree

if (place_meeting(x, y - 24, objPlayer) or place_meeting(x, y - 11, objPlayer)) {
    
    draw_set_alpha(0.6);
    draw_sprite(sprTree, 0, x, y);
    draw_set_alpha(1);
    
} else {
    
    draw_self();
    
}