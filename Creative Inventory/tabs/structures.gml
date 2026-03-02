#define DrawStructuresTab(_menu)

    var _structs = surface_create(600, 550);
    
    surface_set_target(_structs);
    
    draw_clear_alpha(c_black, 0);
    
    var _offset = 0;
    
    for (var i = 0; i < array_length(Data.structures); i++) {
        
        if (i != Structure.Industrial and i != Structure.Farming and i != Structure.Economic and i != Structure.Magical and !(i >= Structure.Fence and i <= Structure.Signpost) and !(i >= Structure.StoneGate - 1 and i < Structure.Count)) {
        
            var _xx = (i - _offset) - (floor((i - _offset) / 12) * 12);
            var _yy = floor((i - _offset) / 12);
        
            if (5 + 50 * _yy - global.scroll > -50 and 5 + 50 * _yy - global.scroll < 600) { 
                
                draw_set_alpha(1);
                
                draw_rectangle_color(5 + 50 * _xx, 5 + 50 * _yy - global.scroll, 45 + 50 * _xx, 45 + 50 * _yy - global.scroll, c_gray, c_gray, c_gray, c_gray, true);
                
                draw_sprite_stretched(StructureGet(i, StructureData.Sprite), 0, 9 + 50 * _xx, 9 + 50 * _yy - global.scroll, 32, 32);
                
                draw_set_alpha(0.75);
                
                if (mouse_get_raw_x() > global.CreativeMenuPos[0] + 5 + 50 * _xx and mouse_get_raw_x() < global.CreativeMenuPos[0] + 5 + 50 * _xx + 40 and mouse_get_raw_y() > global.CreativeMenuPos[1] + 55 + 50 * _yy - global.scroll and mouse_get_raw_y() < global.CreativeMenuPos[1] + 55 + 50 * _yy + 40 - global.scroll) {
                    
                    draw_rectangle_color(5 + 50 * _xx, 5 + 50 * _yy - global.scroll, 45 + 50 * _xx, 45 + 50 * _yy - global.scroll, c_white, c_white, c_white, c_white, false);
                    
                    global.descDraw = [StructureGet(i, StructureData.Name), StructureGet(i, StructureData.Description), sprEmpty];
                
                }
                
            } else if (5 + 50 * _yy - global.scroll > 600) {
            
                break;
            
            }
            
        } else {
            
            _offset++;
            
        }
        
    }
    
    surface_reset_target();
    
    surface_set_target(_menu);

    draw_set_alpha(1);

    draw_surface(_structs, 0, 50);

    surface_reset_target();
    
    surface_free(_structs);
    
#define StepStructuresTab

    if (global.structureSelect == -1) {
    
        var _offset = 0;
    
        for (var i = 0; i < array_length(Data.structures); i++) {
            
            if (i != Structure.Industrial and i != Structure.Farming and i != Structure.Economic and i != Structure.Magical and !(i >= Structure.Fence and i <= Structure.Signpost) and !(i >= Structure.StoneGate - 1 and i < Structure.Count)) {
            
                var _xx = (i - _offset) - (floor((i - _offset) / 12) * 12);
                var _yy = floor((i - _offset) / 12);
                
                if (mouse_get_raw_x() > global.CreativeMenuPos[0] + 5 + 50 * _xx and mouse_get_raw_x() < global.CreativeMenuPos[0] + 5 + 50 * _xx + 40 and mouse_get_raw_y() > global.CreativeMenuPos[1] + 55 + 50 * _yy - global.scroll and mouse_get_raw_y() < global.CreativeMenuPos[1] + 55 + 50 * _yy + 40 - global.scroll) {
                    
                    global.structureSelect = i;
                    
                }
                
            } else {
                
                _offset++;
                
            }
            
        }
        
    } else {
        
        if (mouse_check_button_pressed(mb_right)) {
            
            global.structureSelect = -1;
            
        } else if (mouse_check_button_pressed(mb_left)) {
            
            var _xx = mouse_x;
            var _yy = mouse_y;

            var _size = StructureGet(global.structureSelect, StructureData.Size);
            
            if (global.gridSnap) {
            
                _xx = (floor(mouse_x / 16) + 1) * 16;
                _yy = (floor(mouse_y / 16) + 1) * 16;
                
                if (_size mod 2 == 1) {
                    
                    _xx -= 8;
                    _yy -= 8;
                    
                }
                
            }
            
            var _inst = instance_create_depth(_xx, _yy, -_yy, StructureGet(global.structureSelect, StructureData.Object));
            if (global.structureSelect >= Structure.Count) {
                
                _inst.structure = global.structureSelect;
                _inst.selectionSize = StructureGet(global.structureSelect, StructureData.Size);
                _inst.blueprintItems = StructureGet(global.structureSelect, StructureData.Items);
                _inst.blueprint = StructureGet(global.structureSelect, StructureData.Blueprint);
                
            }
            if (!keyboard_check(vk_shift)) global.structureSelect = -1;
            
        }
        
    }