#define SelectionDraw

    #region Pickaxe selection
    
        if (instance_exists(objPlayer)) {
            
            var _select = GetSelection();
            
            if ((ToolSelected() == GearGet(global.Gear_Pickaxe, GearData.Current)) and _select != noone) {
                
                if (instance_exists(_select)) {
                
                    if (object_is_ancestor(_select.object_index, parNatural) or object_is_ancestor(_select.object_index, parHerb)) {
                    
                        draw_sprite(sprCursor1x1, objPlayer.selectFrame div 3, _select.x div 16 * 16 + 8, _select.y div 16 * 16 + 8);
                        objPlayer.selectFrame++;
                        if (objPlayer.selectFrame == 30) objPlayer.selectFrame = 0;
                        
                    }
                    
                }
                
            }
            
        }
    
    #endregion
    
    #region FishTrap Selection
    
        if (instance_exists(objPlayer)) {
            
            var _select = GetSelection();
            
            if (ToolSelected() == global.Item_FishTrap and WaterCollision(mouse_x, mouse_y) and _select == noone and point_distance(objPlayer.x, objPlayer.y, mouse_x, mouse_y) < 32) {
                
                draw_sprite(sprCursor1x1, objPlayer.selectFrame div 3, mouse_x div 16 * 16 + 8, mouse_y div 16 * 16 + 8);
                objPlayer.selectFrame++;
                if (objPlayer.selectFrame == 30) objPlayer.selectFrame = 0;
                
            }
            
        }
    
    #endregion
    
    #region Wooden Crate Selection
    
        if (instance_exists(objPlayer)) {
            
            var _select = GetSelection();
            
            if (ToolSelected() == global.Item_WoodenCrate and !WaterCollision(mouse_x, mouse_y) and _select == noone and point_distance(objPlayer.x, objPlayer.y, mouse_x, mouse_y) < 32) {
                
                draw_sprite(sprCursor1x1, objPlayer.selectFrame div 3, mouse_x div 16 * 16 + 8, mouse_y div 16 * 16 + 8);
                objPlayer.selectFrame++;
                if (objPlayer.selectFrame == 30) objPlayer.selectFrame = 0;
                
            }
            
        }
    
    #endregion
    
    #region Dye Selection
    
        if (instance_exists(objPlayer)) {
    
            for (var i = 0; i < array_length(global.Data_Dyes); i++) {
                
                var _select = GetSelection();
                
                if (ToolSelected() == global.Data_Dyes[i][0] and _select != noone) {
                    
                    if (object_is_ancestor(_select.object_index, parObject)) {
                    
                        draw_sprite(sprCursor1x1, objPlayer.selectFrame div 3, _select.x, _select.y);
                        objPlayer.selectFrame++;
                        if (objPlayer.selectFrame == 30) objPlayer.selectFrame = 0;
                        
                    }
                    
                }
                
            }
            
        }
    
    #endregion
    
    #region Shovel Selection
    
        if (instance_exists(objPlayer)) {
            
            if ((ToolSelected() == global.Item_WoodenShovel) and point_distance(mouse_x, mouse_y, objPlayer.x, objPlayer.y) < 32 and !WaterCollision(mouse_x, mouse_y) and GetSelection() == noone) {
                
                var _select = instance_position(mouse_x, mouse_y, objDirt);
                
                if (!instance_exists(_select)) {
                    
                    draw_sprite(sprCursor1x1, objPlayer.selectFrame div 3, mouse_x div 16 * 16 + 8, mouse_y div 16 * 16 + 8);
                    objPlayer.selectFrame++;
                    if (objPlayer.selectFrame == 30) objPlayer.selectFrame = 0;
                    
                }
                
            }
            
        }
    
    #endregion