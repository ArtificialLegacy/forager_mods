#define DrawWorldTab(_menu)

    var _items = surface_create(600, 550);
    
    surface_set_target(_items);
    
    draw_clear_alpha(c_black, 0);
    
    draw_set_halign(fa_left);
    
    draw_text_transformed(50, 28, "obliterate npc/building", 0.8, 0.8, 0);
    draw_rectangle_color(15, 10, 35, 30, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(28, 30, "+");
    if (mouse_get_raw_x() > 15 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 35 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 10 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 30 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(15, 10, 35, 30, c_gray, c_gray, c_gray, c_gray, false);
        draw_set_alpha(1);
        
    }
    
    draw_text_transformed(50, 58, "edit chest loot", 0.8, 0.8, 0);
    draw_rectangle_color(15, 40, 35, 60, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(28, 60, "+");
    if (mouse_get_raw_x() > 15 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 35 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 40 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 60 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(15, 40, 35, 60, c_gray, c_gray, c_gray, c_gray, false);
        draw_set_alpha(1);
        
    }
    
    draw_text_transformed(50, 88, "teleport to cursor", 0.8, 0.8, 0);
    draw_rectangle_color(15, 70, 35, 90, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(28, 90, "+");
    if (mouse_get_raw_x() > 15 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 35 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 70 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 90 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(15, 70, 35, 90, c_gray, c_gray, c_gray, c_gray, false);
        draw_set_alpha(1);
        
    }
    
    
    
    surface_reset_target();
    
    surface_set_target(_menu);

    draw_set_alpha(1);

    draw_surface(_items, 0, 50);

    surface_reset_target();
    
    surface_free(_items);
    
#define StepWorldTab

    if (global.editSelect == -1) {
        
        if (mouse_get_raw_x() > 15 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 35 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 10 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 30 + global.CreativeMenuPos[1] + 50) {
            
            global.editSelect = 0;
            
        }
        
        if (mouse_get_raw_x() > 15 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 35 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 40 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 60 + global.CreativeMenuPos[1] + 50) {
            
            global.editSelect = 1;
            
        }
        
        if (mouse_get_raw_x() > 15 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 35 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 70 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 90 + global.CreativeMenuPos[1] + 50) {
            
            global.editSelect = 2;
            
        }
        
    } else if (global.editSelect == 0) {
        
        if (mouse_check_button_pressed(mb_right)) {
            
            global.editSelect = -1;
            
        } else if (mouse_check_button_pressed(mb_left)) {
            
            for (var i = 0; i < array_length(global.obliterateObjects); i++) {
                
                var _inst = instance_place(mouse_x, mouse_y, global.obliterateObjects[i]);
                
                with (_inst) {
                    
                    if (object_index == objPlayer) continue;
                    
                    instance_destroy(id);
                    
                    if (!keyboard_check(vk_shift)) global.editSelect = -1;
                    
                    break;
                    
                }
                
            }
            
        }
        
    } else if (global.editSelect == 1) {
        
        if (mouse_check_button_pressed(mb_right)) {
            
            global.editSelect = -1;
            
        } else if (mouse_check_button_pressed(mb_left)) {
            
            var _inst = instance_place(mouse_x, mouse_y, objTreasureChest);
            
            with (_inst) {
                
                global.editSelect = 3;
                global.chestSelect = _inst;
                
            }
            
        }
        
    } else if (global.editSelect == 2) {
        
        if (mouse_check_button_pressed(mb_right)) {
            
            global.editSelect = -1;
            
        } else if (mouse_check_button_pressed(mb_left)) {
            
            objPlayer.x = mouse_x;
            objPlayer.y = mouse_y;
            
            if (!keyboard_check(vk_shift)) global.editSelect = -1;
            
        }
        
    } else if (global.editSelect == 3) {
        
        if (mouse_check_button_pressed(mb_right)) {
            
            global.editSelect = -1;
            global.chestSelect = noone;
            
        } else if (mouse_check_button_pressed(mb_left)) {
            
            for (var i = 0; i < array_length(global.gear); i++) {
                
                var _item = global.gear[i];
                
                var _type = ItemGet(_item, ItemData.Type);
                var _subtype = ItemGet(_item, ItemData.SubType);
                
                var _xx = (i) - (floor((i) / 12) * 12);
                var _yy = floor((i) / 12);
                
                if (5 + 50 * _yy - global.scroll > -50 and 5 + 50 * _yy - global.scroll < 600) {
                    
                    if (mouse_get_raw_x() > global.CreativeMenuPos[0] + 5 + 50 * _xx and mouse_get_raw_x() < global.CreativeMenuPos[0] + 5 + 50 * _xx + 40 and mouse_get_raw_y() > global.CreativeMenuPos[1] + 50 * _yy - global.scroll and mouse_get_raw_y() < global.CreativeMenuPos[1] + 50 * _yy + 40 - global.scroll) {
                        
                        global.chestSelect.setReward = _item;
                        global.editSelect = -1;
                        global.chestSelect = noone;
                        
                    }
                    
                } else if (5 + 50 * _yy - global.scroll > 600) {
                    
                    break;
                    
                }
                
            }
            
        }
        
    }
    
#define DrawChestEdit()

    var _menu = surface_create(600, 600);

    surface_set_target(_menu);
    
    draw_set_alpha(0.5);
    
    draw_rectangle_color(0, 0, 600, 600, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(1, 1, 598, 598, c_gray, c_gray, c_gray, c_gray, true);
    
    draw_set_alpha(1);
    
    for (var i = 0; i < array_length(global.gear); i++) {
        
        var _item = global.gear[i];
        
        var _type = ItemGet(_item, ItemData.Type);
        var _subtype = ItemGet(_item, ItemData.SubType);
        
        var _xx = (i) - (floor((i) / 12) * 12);
        var _yy = floor((i) / 12);
    
        if (5 + 50 * _yy - global.scroll > -50 and 5 + 50 * _yy - global.scroll < 600) { 
        
            draw_set_alpha(1);
            
            draw_rectangle_color(5 + 50 * _xx, 5 + 50 * _yy - global.scroll, 45 + 50 * _xx, 45 + 50 * _yy - global.scroll, c_gray, c_gray, c_gray, c_gray, true);
            
            draw_sprite_stretched(ItemGet(_item, ItemData.Sprite), 0, 9 + 50 * _xx, 9 + 50 * _yy - global.scroll, 32, 32);
            
            draw_set_alpha(0.75);
            
            if (mouse_get_raw_x() > global.CreativeMenuPos[0] + 5 + 50 * _xx and mouse_get_raw_x() < global.CreativeMenuPos[0] + 5 + 50 * _xx + 40 and mouse_get_raw_y() > global.CreativeMenuPos[1] + 50 * _yy - global.scroll and mouse_get_raw_y() < global.CreativeMenuPos[1] + 50 * _yy + 40 - global.scroll) {
                
                draw_rectangle_color(5 + 50 * _xx, 5 + 50 * _yy - global.scroll, 45 + 50 * _xx, 45 + 50 * _yy - global.scroll, c_white, c_white, c_white, c_white, false);
                
            }
            
        } else if (5 + 50 * _yy - global.scroll > 600) {
            
            break;
            
        }
        
    }
    
    draw_set_alpha(1);
    
    surface_reset_target();
    
    draw_surface(_menu, global.CreativeMenuPos[0], global.CreativeMenuPos[1]);
    
    surface_free(_menu);
    
    
    