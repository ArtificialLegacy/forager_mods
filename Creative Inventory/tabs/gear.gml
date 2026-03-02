#define DrawGearTab(_menu)

    if (_menu == undefined) return;
    if (!is_real(global.scroll)) global.scroll = 0;

    var _items = surface_create(600, 550);
    
    surface_set_target(_items);
    
    draw_clear_alpha(c_black, 0);
    
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
            
            if (mouse_get_raw_x() > global.CreativeMenuPos[0] + 5 + 50 * _xx and mouse_get_raw_x() < global.CreativeMenuPos[0] + 5 + 50 * _xx + 40 and mouse_get_raw_y() > global.CreativeMenuPos[1] + 55 + 50 * _yy - global.scroll and mouse_get_raw_y() < global.CreativeMenuPos[1] + 55 + 50 * _yy + 40 - global.scroll) {
                
                draw_rectangle_color(5 + 50 * _xx, 5 + 50 * _yy - global.scroll, 45 + 50 * _xx, 45 + 50 * _yy - global.scroll, c_white, c_white, c_white, c_white, false);
                
                global.descDraw = [ItemGet(_item, ItemData.Name), ItemGet(_item, ItemData.Description), ItemGet(_item, ItemData.Sprite)];
                
            }
            
        } else if (5 + 50 * _yy - global.scroll > 600) {
            
            break;
            
        }
        
    }
    
    surface_reset_target();
    
    surface_set_target(_menu);

    draw_set_alpha(1);

    draw_surface(_items, 0, 50);

    surface_reset_target();
    
    surface_free(_items);
    
#define StepGearTab

    for (var i = 0; i < array_length(global.gear); i++) {
        
        var _item = global.gear[i];
        
        var _type = ItemGet(_item, ItemData.Type);
        var _subtype = ItemGet(_item, ItemData.SubType);
            
        var _xx = (i) - (floor((i) / 12) * 12);
        var _yy = floor((i) / 12);
        
        if (mouse_get_raw_x() > global.CreativeMenuPos[0] + 5 + 50 * _xx and mouse_get_raw_x() < global.CreativeMenuPos[0] + 5 + 50 * _xx + 40 and mouse_get_raw_y() > global.CreativeMenuPos[1] + 55 + 50 * _yy - global.scroll and mouse_get_raw_y() < global.CreativeMenuPos[1] + 55 + 50 * _yy + 40 - global.scroll) {
            
            if (mouse_check_button_pressed(mb_left))  GainItem(_item, global.itemIncrements[global.itemIncrement][1]);
            if (mouse_check_button_pressed(mb_right)) RemoveItem(_item, ItemCount(_item, true));
        
        }
        
    }