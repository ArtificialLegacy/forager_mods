#define OnDrawGUIEnd

    if (room == rmGame and !MenuOpen()) {
        
        var _menu = surface_create(600, 600);
        
        if (objPlayer.creativeMenuOpen and global.structureSelect == -1 and global.editSelect == -1) {
            
            surface_set_target(_menu);
            
            draw_set_alpha(0.5);
            
            draw_rectangle_color(0, 0, 600, 600, c_black, c_black, c_black, c_black, false);
            draw_rectangle_color(1, 1, 598, 598, c_gray, c_gray, c_gray, c_gray, true);
            
            draw_line_color(0, 50, 600, 50, c_gray, c_gray);
            
            draw_set_alpha(1);
            
            draw_sprite_stretched(sprJelly, 0, 10, 10, 32, 32);
            draw_sprite_stretched(sprBerry, 0, 60, 10, 32, 32);
            draw_sprite_stretched(sprBedItem, 0, 110, 10, 32, 32);
            draw_sprite_stretched(sprPickaxe, 0, 158, 10, 32, 32);
            draw_sprite_stretched(sprFurnace, 0, 210, 5, 32, 40);
            draw_sprite_stretched(sprSlime, 0, 260, 8, 32, 32);
            draw_sprite_stretched(sprBush, 3, 310, 8, 32, 32);
            draw_sprite_stretched(sprRainbow, 3, 360, 8, 32, 32);
            draw_sprite_stretched(sprLandfill, 3, 410, 8, 32, 32);
            draw_sprite_stretched(sprStaminaVessel, 0, 560, 10, 32, 32);
            draw_sprite_stretched(sprUnknownItem, 0, 510, 10, 32, 32);
            
            for (var i = 0; i < 4; i++) {
                
                draw_set_alpha(1);
                
                draw_rectangle_color(5 + 50 * i, 5, 45 + 50 * i, 45, c_gray, c_gray, c_gray, c_gray, true);
                
                draw_set_alpha(0.5);
                
                if (objPlayer.creativeMenuTab == i) {
                    
                    draw_rectangle_color(5 + 50 * i, 5, 45 + 50 * i, 45, c_white, c_white, c_white, c_white, false);
                    
                } else if (mouse_get_raw_x() > 5 + 50 * i + global.CreativeMenuPos[0] and mouse_get_raw_x() < 5 + 50 * i + 40 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                    
                    draw_rectangle_color(5 + 50 * i, 5, 45 + 50 * i, 45, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
                    
                }
                
            }
            
            draw_set_alpha(1);
            
            draw_rectangle_color(205, 5, 245, 45, c_gray, c_gray, c_gray, c_gray, true);
            
            draw_set_alpha(0.5);
            
            if (objPlayer.creativeMenuTab == CreativeMenuTab.Structures) {
                
                draw_rectangle_color(205, 5, 245, 45, c_white, c_white, c_white, c_white, false);
                
            } else if (mouse_get_raw_x() > 205 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 254 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                
                draw_rectangle_color(205, 5, 245, 45, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
                
            }
            
            draw_set_alpha(1);
            
            draw_rectangle_color(255, 5, 295, 45, c_gray, c_gray, c_gray, c_gray, true);
            
            draw_set_alpha(0.5);
            
            if (objPlayer.creativeMenuTab == CreativeMenuTab.Entities) {
                
                draw_rectangle_color(255, 5, 295, 45, c_white, c_white, c_white, c_white, false);
                
            } else if (mouse_get_raw_x() > 255 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 294 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                
                draw_rectangle_color(255, 5, 295, 45, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
                
            }
            
            draw_set_alpha(1);
            
            draw_rectangle_color(305, 5, 345, 45, c_gray, c_gray, c_gray, c_gray, true);
            
            draw_set_alpha(0.5);
            
            if (objPlayer.creativeMenuTab == CreativeMenuTab.Spawns) {
                
                draw_rectangle_color(305, 5, 345, 45, c_white, c_white, c_white, c_white, false);
                
            } else if (mouse_get_raw_x() > 305 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 344 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                
                draw_rectangle_color(305, 5, 345, 45, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
                
            }
            
            draw_set_alpha(1);
            
            draw_rectangle_color(355, 5, 395, 45, c_gray, c_gray, c_gray, c_gray, true);
            
            draw_set_alpha(0.5);
            
            if (objPlayer.creativeMenuTab == CreativeMenuTab.Buildings) {
                
                draw_rectangle_color(355, 5, 395, 45, c_white, c_white, c_white, c_white, false);
                
            } else if (mouse_get_raw_x() > 355 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 394 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                
                draw_rectangle_color(355, 5, 395, 45, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
                
            }
            
            draw_set_alpha(1);
            
            draw_rectangle_color(405, 5, 445, 45, c_gray, c_gray, c_gray, c_gray, true);
            
            draw_set_alpha(0.5);
            
            if (objPlayer.creativeMenuTab == CreativeMenuTab.World) {
                
                draw_rectangle_color(405, 5, 445, 45, c_white, c_white, c_white, c_white, false);
                
            } else if (mouse_get_raw_x() > 405 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 445 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                
                draw_rectangle_color(405, 5, 445, 45, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
                
            }
            
            draw_set_alpha(1);
            
            draw_rectangle_color(555, 5, 595, 45, c_gray, c_gray, c_gray, c_gray, true);
            
            draw_set_alpha(0.5);
            
            if (objPlayer.creativeMenuTab == CreativeMenuTab.Stats) {
                
                draw_rectangle_color(555, 5, 595, 45, c_white, c_white, c_white, c_white, false);
                
            } else if (mouse_get_raw_x() > 555 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 595 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                
                draw_rectangle_color(555, 5, 595, 45, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
                
            }
            
            draw_set_alpha(1);
            
            draw_rectangle_color(505, 5, 545, 45, c_gray, c_gray, c_gray, c_gray, true);
            
            draw_set_alpha(0.5);
            
            if (objPlayer.creativeMenuTab == CreativeMenuTab.Info) {
                
                draw_rectangle_color(505, 5, 545, 45, c_white, c_white, c_white, c_white, false);
                
            } else if (mouse_get_raw_x() > 505 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 545 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                
                draw_rectangle_color(505, 5, 545, 45, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
                
            }
            
            draw_set_alpha(1);
            
            surface_reset_target();
            
            if (objPlayer.creativeMenuTab == CreativeMenuTab.Materials) {
                
                DrawMaterialsTab(_menu);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Consumables) {
                
                DrawConsumablesTab(_menu);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.ItemStructures) {
                
                DrawPlaceablesTab(_menu);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Gear) {
                
                DrawGearTab(_menu);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Stats) {
                
                DrawStatsTab(_menu);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Structures) {
                
                DrawStructuresTab(_menu);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Entities) {
                
                DrawEnemiesTab(_menu);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Spawns) {
                
                DrawResourceTab(_menu);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Buildings) {
                
                DrawBuildingTab(_menu);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Info) {
                
                DrawInfoTab(_menu);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.World) {
                
                DrawWorldTab(_menu);
                
            }
            
            var _desc = surface_create(200, 600);
            
            if (objPlayer.creativeMenuTab == CreativeMenuTab.Materials or objPlayer.creativeMenuTab == CreativeMenuTab.Consumables or objPlayer.creativeMenuTab == CreativeMenuTab.ItemStructures or objPlayer.creativeMenuTab == CreativeMenuTab.Gear or objPlayer.creativeMenuTab == CreativeMenuTab.Structures) {
                
                if (surface_exists(_desc)) {
                    
                    surface_set_target(_desc);
                    
                    draw_clear_alpha(c_black, 0);
                    
                    draw_set_alpha(0.75);
                    
                    draw_rectangle_color(0, 0, 200, 600, c_black, c_black, c_black, c_black, false);
                    draw_rectangle_color(1, 1, 198, 598, c_gray, c_gray, c_gray, c_gray, true);
                    
                    draw_set_alpha(1);
                    
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_top);
                    
                    draw_text_ext(100, 20, global.descDraw[0], 20, 200);
                    draw_sprite_ext(global.descDraw[2], 0, 90, 80, 3, 3, 0, c_white, 1);
                    draw_text_ext_transformed(100, 120, global.descDraw[1], 20, 200, 0.7, 0.7, 0);
                    
                    draw_set_halign(fa_left);
                    draw_set_valign(fa_middle);
                    
                    draw_set_alpha(1);
                    
                    surface_reset_target();
                    
                    draw_surface(_desc, global.CreativeMenuPos[0] + 610, global.CreativeMenuPos[1]);
                    
                }
                
            }
            
            draw_surface(_menu, global.CreativeMenuPos[0], global.CreativeMenuPos[1]);
            
            surface_free(_menu);
            if (surface_exists(_desc)) surface_free(_desc);
            
        } else if (global.editSelect == 3) {
            
            DrawChestEdit();
            
        }
        
    }