#define DrawBuildingTab(_menu)

    var _buildings = surface_create(600, 550);
    
    surface_set_target(_buildings);
    
    draw_clear_alpha(c_black, 0);
    
    for (var i = 0; i < array_length(global.buildings); i++) {
        
        var _xx = (i) - (floor((i) / 12) * 12);
        var _yy = floor((i) / 12);
        
        draw_set_alpha(1);
        
        draw_rectangle_color(5 + 50 * _xx, 5 + 50 * _yy, 45 + 50 * _xx, 45 + 50 * _yy, c_gray, c_gray, c_gray, c_gray, true);
        
        draw_sprite_stretched(global.buildings[i][1], global.buildings[i][2], 9 + 50 * _xx, 9 + 50 * _yy, 32, 32);
        
        draw_set_alpha(0.75);
        
        if (mouse_get_raw_x() > global.CreativeMenuPos[0] + 5 + 50 * _xx and mouse_get_raw_x() < global.CreativeMenuPos[0] + 5 + 50 * _xx + 40 and mouse_get_raw_y() > global.CreativeMenuPos[1] + 55 + 50 * _yy and mouse_get_raw_y() < global.CreativeMenuPos[1] + 55 + 50 * _yy + 40) {
        
            draw_rectangle_color(5 + 50 * _xx, 5 + 50 * _yy, 45 + 50 * _xx, 45 + 50 * _yy, c_white, c_white, c_white, c_white, false);
        
        }
        
    }
    
    surface_reset_target();
    
    surface_set_target(_menu);

    draw_set_alpha(1);

    draw_surface(_buildings, 0, 50);

    surface_reset_target();
    
    surface_free(_buildings);
    
#define StepBuildingTab

    if (global.structureSelect == -1) {
    
    for (var i = 0; i < array_length(global.buildings); i++) {
        
        var _xx = (i) - (floor((i) / 12) * 12);
        var _yy = floor((i) / 12);
        
        if (mouse_get_raw_x() > global.CreativeMenuPos[0] + 5 + 50 * _xx and mouse_get_raw_x() < global.CreativeMenuPos[0] + 5 + 50 * _xx + 40 and mouse_get_raw_y() > global.CreativeMenuPos[1] + 55 + 50 * _yy and mouse_get_raw_y() < global.CreativeMenuPos[1] + 55 + 50 * _yy + 40) {
            
            global.structureSelect = i;
            
        }
        
    }
    
    } else {
        
        if (mouse_check_button_pressed(mb_right)) {
            
            global.structureSelect = -1;
            
        } else if (mouse_check_button_pressed(mb_left)) {
            
            var _xx = mouse_x;
            var _yy = mouse_y;
            
            if (global.gridSnap) {
            
                _xx = (floor(mouse_x / 16) + 1) * 16 - 8;
                _yy = (floor(mouse_y / 16) + 1) * 16 - 8;
                
            }
            
            var _inst = instance_create_depth(_xx, _yy, -_yy, global.buildings[global.structureSelect][0]);
            _inst.sprite_index = global.buildings[global.structureSelect][1];
            _inst.image_index = global.buildings[global.structureSelect][2];
            if (!keyboard_check(vk_shift)) global.structureSelect = -1;
            
        }
        
    }