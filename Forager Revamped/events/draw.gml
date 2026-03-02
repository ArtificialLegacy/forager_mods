#define OnDraw

    #region Slingshot
    
    if (room == rmGame) {
        
        if (objPlayer.slingshotCharge > 0) {
            
            var _dir = point_direction(objPlayer.x, objPlayer.y, mouse_x, mouse_y);
            
            var _x = objPlayer.x + lengthdir_x(objPlayer.slingshotCharge, _dir);
            var _y = objPlayer.y + lengthdir_y(objPlayer.slingshotCharge, _dir);
            
            if (objPlayer.slingshotCharge < 70) {
                
                draw_sprite_ext(sprArcheryCrosshair, 0, _x, _y, 1, 1, _dir, c_white, 1);
                
            } else if (objPlayer.slingshotCharge < 100) {
                
                draw_sprite_ext(sprArcheryCrosshair, 0, _x, _y, 1, 1, _dir, c_lime, 1);
                
            } else if (objPlayer.slingshotCharge == 100) {
                
                draw_sprite_ext(sprArcheryCrosshair, 0, _x, _y, 1.2, 1.2, _dir, c_lime, 1);
                
            }
            
            for (var i = 0; i < objPlayer.slingshotCharge; i += 20) {
                
                var _x = objPlayer.x + lengthdir_x(i, _dir);
                var _y = objPlayer.y + lengthdir_y(i, _dir);
                
                if (objPlayer.slingshotCharge < 70) {
                
                    draw_sprite_ext(sprArcheryCrossChain, 0, _x, _y, 1, 1, _dir, c_white, 1);
                    
                } else if (objPlayer.slingshotCharge < 100) {
                    
                    draw_sprite_ext(sprArcheryCrossChain, 0, _x, _y, 1, 1, _dir, c_lime, 1);
                    
                } else if (objPlayer.slingshotCharge == 100) {
                    
                    draw_sprite_ext(sprArcheryCrossChain, 0, _x, _y, 1.2, 1.2, _dir, c_lime, 1);
                    
                }
                
            }
            
        }
    
    }
    
    #endregion
    
    #region Draw Skill Stuff
    
    if (room == rmSkillGrid) {
        
        if (objSkillGridControl.skillInspection == noone) {
    
            with (objSkill) {
                
                if (global.Data_TempSkills[? "skill_" + global.Data_Skills[? skillID][? "name"]] == OBTAINED) {
                    
                    nameAlpha = 1;
                    image_index = 2;
                    
                } else {
                    
                    image_index = 1;
                    
                }
                
            }
            
            draw_line_color(room_width div 2, room_height div 2, room_width div 2 + 60, room_height div 2, c_white, c_white);
            draw_line_color(room_width div 2 + 60, room_height div 2 - 40, room_width div 2 + 60, room_height div 2 + 40, c_white, c_white);
            draw_line_color(room_width div 2 + 60, room_height div 2 - 40, room_width div 2 + 120, room_height div 2 - 40, c_white, c_white);
            draw_line_color(room_width div 2 + 120, room_height div 2 - 40, room_width div 2 + 180, room_height div 2 - 40, c_white, c_white);
            draw_line_color(room_width div 2 + 60, room_height div 2 + 40, room_width div 2 + 60, room_height div 2 + 100, c_white, c_white);
            draw_line_color(room_width div 2 + 60, room_height div 2 + 40, room_width div 2 + 120, room_height div 2 + 40, c_white, c_white);
            draw_line_color(room_width div 2, room_height div 2, room_width div 2, room_height div 2 - 80, c_white, c_white);
            draw_line_color(room_width div 2 + 120, room_height div 2 + 40, room_width div 2 + 180, room_height div 2 + 40, c_white, c_white);
            draw_line_color(room_width div 2 + 180, room_height div 2, room_width div 2 + 180, room_height div 2 + 80, c_white, c_white);
            draw_line_color(room_width div 2 + 180, room_height div 2 + 80, room_width div 2 + 240, room_height div 2 + 80, c_white, c_white);
            draw_line_color(room_width div 2, room_height div 2, room_width div 2 - 60, room_height div 2, c_white, c_white);
            draw_line_color(room_width div 2 - 60, room_height div 2 - 40, room_width div 2 - 60, room_height div 2, c_white, c_white);
            draw_line_color(room_width div 2 - 60, room_height div 2 - 40, room_width div 2 - 120, room_height div 2 - 40, c_white, c_white);
            draw_line_color(room_width div 2 + 60, room_height div 2 - 40, room_width div 2 + 60, room_height div 2 - 100, c_white, c_white);
            draw_line_color(room_width div 2 - 60, room_height div 2 - 40, room_width div 2 - 60, room_height div 2 - 100, c_white, c_white);
            draw_line_color(room_width div 2 - 120, room_height div 2 - 40, room_width div 2 - 120, room_height div 2 - 100, c_white, c_white);
            draw_line_color(room_width div 2, room_height div 2 - 80, room_width div 2, room_height div 2 - 140, c_white, c_white);
            
        }
        
    }
    
    #endregion
    
#define OnDrawGUI

    #region DrawGUI

    if (room == rmGame) {

        DrawGUI();
        
    }
    
    #endregion
    
    #region QuestComplete
    
        if (room == rmGame) {
        
            if (objPlayer.questCompleteTimer > 0) {
                
                objPlayer.questCompleteTimer--;
                
                draw_text_transformed(display_get_gui_width() div 2, 150, "quest complete: " + objPlayer.questComplete[0] + "!", 2, 2, 0);
                
            } else if (array_length(objPlayer.questComplete) > 0) {
                
                objPlayer.questComplete = array_slice(objPlayer.questComplete, 1, array_length(objPlayer.questComplete) - 1);
                
                if (array_length(objPlayer.questComplete) > 0) {
                    
                    objPlayer.questCompleteTimer = 180;
                    
                }
                
            }
            
        }
    
    #endregion
    
#define OnDrawGUIEnd

    #region DrawXP
    
        if (room == rmGame) {
            
            if (!MenuOpen()) {
                
                draw_rectangle_color(239, 6, 1038, 35, c_black, c_black, c_black, c_black, false);
                draw_rectangle_color(239, 6, 239 + (799 / (objPlayer.frXpCap / objPlayer.frXp)), 35, c_yellow, c_yellow, c_yellow, c_yellow, false);
                draw_text(638, 30, "level " + string(objPlayer.frLevel) + " (" + string(objPlayer.frXp) + "/" + string(objPlayer.frXpCap) + ")");
                
            }
            
        }
    
    #endregion
    
    #region Draw WoodenCrate
    
    if (instance_exists(objStorageInventory)) {
        
        if (objStorageInventory.maxSlots == 2) {
            
            draw_sprite_ext(global.Sprite_WoodenCrate, 0, 1049, 543, 12, 12, 0, c_white, 1);
            
        }
        
    }
    
    #endregion
    
    #region Draw Moon Clock
    
    if (room == rmGame) {
        
        var _moonX = 35;
        var _moonY = 640;
        
        switch (TimeControl.moonPhase) {
            
            case MoonStates.NewMoon:
            
                draw_sprite_ext(global.Sprite_NewMoon, 1, _moonX, _moonY, 2, 2, 0, c_white, 0.7);
                
            break;
                
            case MoonStates.CrescentMoon:
            
                draw_sprite_ext(global.Sprite_CrescentMoon, 1, _moonX, _moonY, -2, 2, 0, c_white, 0.7);
                
            break;
                
            case MoonStates.HalfMoon:
            
                draw_sprite_ext(global.Sprite_HalfMoon, 1, _moonX, _moonY, -2, 2, 0, c_white, 0.7);
                
            break;
                
            case MoonStates.GibbousMoon:
            
                draw_sprite_ext(global.Sprite_GibbousMoon, 1, _moonX, _moonY, 2, 2, 0, c_white, 0.7);
                
            break;
                
            case MoonStates.FullMoon:
            
                draw_sprite_ext(global.Sprite_FullMoon, 1, _moonX, _moonY, 2, 2, 0, c_white, 0.7);
                
            break;
            
            case MoonStates.CrescentMoon2:
            
                draw_sprite_ext(global.Sprite_CrescentMoon, 1, _moonX, _moonY, 2, 2, 0, c_white, 0.7);
                
            break;
                
            case MoonStates.HalfMoon2:
            
                draw_sprite_ext(global.Sprite_HalfMoon, 1, _moonX, _moonY, 2, 2, 0, c_white, 0.7);
                
            break;
                
            case MoonStates.GibbousMoon2:
            
                draw_sprite_ext(global.Sprite_GibbousMoon, 1, _moonX, _moonY, -2, 2, 0, c_white, 0.7);
                
            break;
                
            case MoonStates.BloodMoon:
            
                draw_sprite_ext(global.Sprite_BloodMoon, 1, _moonX, _moonY, 2, 2, 0, c_white, 0.7);
                
            break;
            
        }
        
    }
    
    #endregion