#define GetSelection()

    if (instance_exists(objPlayer)) {
        
        var _select = objPlayer.selectionData[0];
        
        return _select;
      
    } else {
    
        return noone;
        
    }