#define UseWoodenCrate
    
    var _select = GetSelection();

    if (!WaterCollision(mouse_x, mouse_y) and _select == noone and point_distance(objPlayer.x, objPlayer.y, mouse_x, mouse_y) < 32) {
        
        var _xx = mouse_x div 16 * 16 + 8;
        var _yy = mouse_y div 16 * 16 + 8;
        
        var _inst = instance_create_depth(_xx, _yy, _yy, objVault);
        
        with (_inst) {
            
            sprite_index = global.Sprite_WoodenCrate;
            maxSlots = 2;
            noDrops = true;
            selectionSize = 1;
            
        }
        
    }
    
#define SaveWoodenCrates()

    #region Nuke Old Crates
    
        var i = 0;
    
        while (ds_map_exists(global.Data_SaveMap, "wooden_crates_" + string(i) + "_x")) {
            
            ds_map_delete(global.Data_SaveMap, "wooden_crates_" + string(i) + "_x");
            ds_map_delete(global.Data_SaveMap, "wooden_crates_" + string(i) + "_y");
            
            i++;
            
        }
    
    #endregion
    
    #region Save New Crates
    
        var _crateInstances = [];
        
        with (objVault) {
            
            if (maxSlots == 2) {
                
                _crateInstances = array_push(_crateInstances, self);
                
            }
            
        }
        
        for (var i = 0; i < array_length(_crateInstances); i++) {
            
            SetSaveKey("wooden_crates_" + string(i) + "_x", _crateInstances[i].x);
            SetSaveKey("wooden_crates_" + string(i) + "_y", _crateInstances[i].y);
            
        }
    
    #endregion