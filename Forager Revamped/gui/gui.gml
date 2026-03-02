#define CreateGUI(_draw, _step, _menu)

    return [_draw, _step, _menu];

#define SetGUI(_gui)

    objPlayer.currentGUI = _gui;
    
#define ClearGUI

    objPlayer.currentGUI = [noone, noone];

#define DrawGUI

    if (objPlayer.currentGUI[0] != noone) {
        
        if ((objPlayer.currentGUI[2] and !MenuOpen()) or (!objPlayer.currentGUI[2])) {
        
            script_execute(objPlayer.currentGUI[0]);
            
        }
        
    }
    
#define UpdateGUI

    if (objPlayer.currentGUI[1] != noone) {
        
        if ((objPlayer.currentGUI[2] and !MenuOpen()) or (!objPlayer.currentGUI[2])) {
        
            script_execute(objPlayer.currentGUI[1]);
            
        }
        
    }