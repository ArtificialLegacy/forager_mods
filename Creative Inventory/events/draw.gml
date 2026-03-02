#define OnDraw

    if (room == rmGame) {
        
        if (global.structureSelect != -1) {
            
            if (objPlayer.creativeMenuTab == CreativeMenuTab.Structures) {

                draw_set_alpha(0.5);
                
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
                
                draw_sprite(StructureGet(global.structureSelect, StructureData.Sprite), 0, _xx, _yy);
                
                draw_set_alpha(1);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Entities) {
                
                draw_set_alpha(0.5);
                
                draw_sprite(global.entities[global.structureSelect][1], 0, mouse_x, mouse_y);
                
                draw_set_alpha(1);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Spawns) {
                
                draw_set_alpha(0.5);
                
                var _xx = mouse_x;
                var _yy = mouse_y;
                
                if (global.gridSnap) {
                
                    _xx = (floor(mouse_x / 16) + 1) * 16 - 8;
                    _yy = (floor(mouse_y / 16) + 1) * 16 - 8;
                    
                }
                
                draw_sprite(global.spawns[global.structureSelect][1], global.spawns[global.structureSelect][2], _xx, _yy);
                
                draw_set_alpha(1);
                
            } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Buildings) {
                
                draw_set_alpha(0.5);
                
                var _xx = mouse_x;
                var _yy = mouse_y;
                
                if (global.gridSnap) {
                
                    _xx = (floor(mouse_x / 16) + 1) * 16 - 8;
                    _yy = (floor(mouse_y / 16) + 1) * 16 - 8;
                    
                }
                
                draw_sprite(global.buildings[global.structureSelect][1], global.buildings[global.structureSelect][2], _xx, _yy);
                
                draw_set_alpha(1);
                
            }
            
        }
        
        if (global.editSelect == 0) {
            
            for (var i = 0; i < array_length(global.obliterateObjects); i++) {
                
                var _inst = instance_place(mouse_x, mouse_y, global.obliterateObjects[i]);
                
                with (_inst) {
                    
                    if (object_index == objPlayer) continue;
                    
                    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_dkgray, 0.5);
                    
                    break;
                    
                }
                
            }
            
        } else if (global.editSelect == 1) {
            
            var _inst = instance_place(mouse_x, mouse_y, objTreasureChest);
            
            with (_inst) {
                
                draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_dkgray, 0.5);
                
            }
            
        }
        
    }