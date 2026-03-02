#define OnStep

    if (room == rmGame and !MenuOpen()) {
        
        if (keyboard_check_pressed(ord("Y"))) {
            
            objPlayer.creativeMenuOpen = !objPlayer.creativeMenuOpen;
            global.structureSelect = -1;
            global.editSelect = -1;
            global.chestSelect = noone;
            
        }
        
        if (keyboard_check_pressed(vk_escape)) {
            
            objPlayer.creativeMenuOpen = false;
            global.structureSelect = -1;
            global.editSelect = -1;
            global.chestSelect = noone;
            
        }
        
        if (objPlayer.creativeMenuOpen) {
            
            if (global.editSelect == 3) {
                
                if (mouse_wheel_up()) {
                    
                    if (global.scroll > 0) {
                        
                        global.scroll -= 30;
                        
                        if (global.scroll < 0) global.scroll = 0;
                        
                    }
                    
                }
                
                if (mouse_wheel_down()) {
                    
                    global.scroll += 30;
                    
                }
                
                var _hy = floor((array_length(global.gear)) / 12);
                
                if (_hy > 10) {
                    
                    if (global.scroll + 550 > 50 * _hy) {
                        
                        global.scroll = (50 * _hy) - 550;
                        
                    }
                    
                } else {
                    
                    global.scroll = 0;
                    
                }
                
            }
            
            if (global.structureSelect == -1 and global.editSelect == -1) {
            
                if (mouse_wheel_up()) {
                    
                    if (global.scroll > 0) {
                        
                        global.scroll -= 30;
                        
                    }
                    
                }
                
                if (mouse_wheel_down()) {
                    
                    global.scroll += 30;
                    
                }
                
                if (global.scroll < 0) global.scroll = 0;
                
                if (objPlayer.creativeMenuTab = CreativeMenuTab.Materials) {
                    
                    var _hy = floor((array_length(global.materials)) / 12);
                    
                    if (_hy > 10) {
                    
                        if (global.scroll + 550 > 55 + 50 * _hy) {
                            
                            global.scroll = (55 + 50 * _hy) - 550;
                            
                        }
                        
                    } else {
                        
                        global.scroll = 0;
                        
                    }
                    
                } else if (objPlayer.creativeMenuTab = CreativeMenuTab.Consumables) {
                    
                    var _hy = floor(array_length(global.consumables) / 12);
                    
                    if (_hy > 10) {
                    
                        if (global.scroll + 550 > 55 + 50 * _hy) {
                            
                            global.scroll = (55 + 50 * _hy) - 550;
                            
                        }
                        
                    } else {
                        
                        global.scroll = 0;
                        
                    }
                    
                } else if (objPlayer.creativeMenuTab = CreativeMenuTab.ItemStructures) {
                    
                    var _hy = floor((array_length(global.itemStructures)) / 12);
                    
                    if (_hy > 10) {
                    
                        if (global.scroll + 550 > 55 + 50 * _hy) {
                            
                            global.scroll = (55 + 50 * _hy) - 550;
                            
                        }
                        
                    } else {
                        
                        global.scroll = 0;
                        
                    }
                    
                } else if (objPlayer.creativeMenuTab = CreativeMenuTab.Gear) {
                    
                    var _hy = floor((array_length(global.gear)) / 12);
                    
                    if (_hy > 10) {
                    
                        if (global.scroll + 550 > 55 + 50 * _hy) {
                            
                            global.scroll = (55 + 50 * _hy) - 550;
                            
                        }
                        
                    } else {
                        
                        global.scroll = 0;
                        
                    }
                    
                } else if (objPlayer.creativeMenuTab = CreativeMenuTab.Structures) {
                    
                    var _hy = floor(((array_length(Data.structures) - 65)) / 12);
                    
                    if (_hy > 10) {
                    
                        if (global.scroll + 550 > 55 + 50 * _hy) {
                            
                            global.scroll = (55 + 50 * _hy) - 550;
                            
                        }
                        
                    } else {
                        
                        global.scroll = 0;
                        
                    }
                    
                }
                
                if (mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right)) {
                    
                    for (var i = 0; i < 4; i++) {
                
                        if (mouse_get_raw_x() > 5 + 50 * i + global.CreativeMenuPos[0] and mouse_get_raw_x() < 5 + 50 * i + 40 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                        
                            objPlayer.creativeMenuTab = i;
                            global.scroll = 0;
                        
                        }
                    
                    } 
                    
                    if (mouse_get_raw_x() > 555 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 595 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                    
                        objPlayer.creativeMenuTab = CreativeMenuTab.Stats;
                        global.structureSelect = -1;
                        global.editSelect = -1;
                    
                    }
                    
                    if (mouse_get_raw_x() > 505 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 545 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                    
                        objPlayer.creativeMenuTab = CreativeMenuTab.Info;
                        global.structureSelect = -1;
                        global.editSelect = -1;
                    
                    }
                    
                    if (mouse_get_raw_x() > 205 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 254 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                    
                        objPlayer.creativeMenuTab = CreativeMenuTab.Structures;
                        global.scroll = 0;
                        global.structureSelect = -1;
                        global.editSelect = -1;
                    
                    }
                    
                    if (mouse_get_raw_x() > 255 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 294 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                    
                        objPlayer.creativeMenuTab = CreativeMenuTab.Entities;
                        global.structureSelect = -1;
                        global.editSelect = -1;
                    
                    }
                    
                    if (mouse_get_raw_x() > 305 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 344 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                    
                        objPlayer.creativeMenuTab = CreativeMenuTab.Spawns;
                        global.structureSelect = -1;
                        global.editSelect = -1;
                    
                    }
                    
                    if (mouse_get_raw_x() > 355 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 394 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                    
                        objPlayer.creativeMenuTab = CreativeMenuTab.Buildings;
                        global.structureSelect = -1;
                        global.editSelect = -1;
                    
                    }
                    
                    if (mouse_get_raw_x() > 405 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 444 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 5 + global.CreativeMenuPos[1] and mouse_get_raw_y() < 45 + global.CreativeMenuPos[1]) {
                    
                        objPlayer.creativeMenuTab = CreativeMenuTab.World;
                        global.structureSelect = -1;
                        global.editSelect = -1;
                    
                    }
                    
                }
            }
            
            if (mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right)) {
            
                if (objPlayer.creativeMenuTab == CreativeMenuTab.Materials) {
                    
                    StepMaterialsTab();
                    
                } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Consumables) {
                    
                    StepConsumeablesTab();
                    
                } else if (objPlayer.creativeMenuTab == CreativeMenuTab.ItemStructures) {
                    
                    StepPlaceablesTab();
                    
                } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Gear) {
                    
                    StepGearTab();
                    
                } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Stats) {
                    
                    StepStatsTab();
                    
                } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Structures) {
                    
                    StepStructuresTab();
                    
                } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Entities) {
                    
                    StepEnemiesTab();
                    
                } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Spawns) {
                    
                    StepResourcesTab();
                    
                } else if (objPlayer.creativeMenuTab == CreativeMenuTab.Buildings) {
                    
                    StepBuildingTab();
                    
                } else if (objPlayer.creativeMenuTab == CreativeMenuTab.World) {
                    
                    StepWorldTab();
                    
                }
                
            }
            
        }
        
    }
    
#define OnStepEnd

    if (room == rmGame) {

        if (objPlayer.invincible) {
            
            objPlayer.hp = objPlayer.hpMax;
            objPlayer.energy = objPlayer.energyMax;
            
        }
        
    }