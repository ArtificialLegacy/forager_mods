/*

    ####################################################
    #                                                  #
    #        Lunar Expansion by ArtificialLegacy       #
    #                                                  #
    ####################################################

*/

#define Main

    InitQuests();
    LoadContent();
    
    enum ResSpawn {
        
        Cobalt,
        Mythril,
        Adamantite,
        Luminite,
        EnergyBush,
    
    }
    
    enum Boss {
        
        CrimsonMoon,
        DivinityMoon,
        
    }
    
#define OnStep

    if (room == rmGame) {
        
        if (objPlayer.energy > objPlayer.energyMax - objPlayer.summonEnergy) {
            
            objPlayer.energy = objPlayer.energyMax - objPlayer.summonEnergy;
            
        }
        
        if (objPlayer.eat > objPlayer.energyMax - objPlayer.summonEnergy) {
            
            objPlayer.eat = objPlayer.energyMax - objPlayer.summonEnergy;
            
        }
        
        if (objPlayer.mageUIOpen) {
         
            if (keyboard_check_pressed(vk_escape) or keyboard_check_pressed(ord("E"))) {
                
                objPlayer.mageUIOpen = false;
                
            }
            
            if (mouse_check_button_pressed(mb_left)) {
                
                InteractLunarMageMenu();
                
            }
           
        }
        
        if (keyboard_check_pressed(ord("E"))) {
            
            if (position_meeting(mouse_x, mouse_y, objModNPC)) {
                
                OnNPCUse();
            
            }
            
        }
        
        if (objPlayer.bossSummonTimer > 0) {
            
            if (objPlayer.bossSummonSkip == 0) {
                
                objPlayer.bossSummonSkip = 30;
                objPlayer.bossSummonTimer--;
                
                BossSummonAnimation();
                
            } else {
                
                objPlayer.bossSummonSkip--;
                
            } 
        
        } else if (objPlayer.bossSummonTimer == 0) {
            
            switch (objPlayer.bossSummon) {
                    
                case Boss.CrimsonMoon:
                    
                    CrimsonMoonSummon();
                    
                break;
                
                case Boss.DivinityMoon:
                
                    MoonOfDivinitySummon();
                
                break;
                
            }
            
            objPlayer.bossSummonTimer = -1;
            
        }
        
    }
    
#define OnDraw

if (room == rmGame) {
    
    if (!is_undefined(objPlayer.summonTarget)) {
        
        if (instance_exists(objPlayer.summonTarget)) {
        
            draw_set_alpha(0.25);
            draw_circle_color(objPlayer.summonTarget.x - 2, objPlayer.summonTarget.y - 2, 5, c_aqua, c_aqua, false);
            draw_set_alpha(1);
            
        } else {
            
            objPlayer.summonTarget = undefined;
            
        }
        
    }
    
}
    
#define OnDrawGUIEnd

if (room == rmGame) {

    if (objPlayer.summonEnergy > 0 and objPlayer.hpMax <= 6) draw_rectangle_color(5 + objPlayer.energyMax, 52, 4 + objPlayer.energyMax - objPlayer.summonEnergy, 67, c_aqua, c_aqua, c_blue, c_blue, false);
    if (objPlayer.summonEnergy > 0 and objPlayer.hpMax > 6 and objPlayer.hpMax <= 12) draw_rectangle_color(5 + objPlayer.energyMax, 84, 4 + objPlayer.energyMax - objPlayer.summonEnergy, 99, c_aqua, c_aqua, c_blue, c_blue, false);
    if (objPlayer.summonEnergy > 0 and objPlayer.hpMax > 12 and objPlayer.hpMax <= 18) draw_rectangle_color(5 + objPlayer.energyMax, 116, 4 + objPlayer.energyMax - objPlayer.summonEnergy, 131, c_aqua, c_aqua, c_blue, c_blue, false);
    
    if (objPlayer.mageUIOpen) {
    
        DrawLunarMageMenu();
    
    }
    
}

#define OnLoad

objPlayer.summonEnergy = 0;
objPlayer.bossSummonTimer = -2;
objPlayer.bossSummonSkip = 0;
objPlayer.bossSummon = undefined;
objPlayer.mageUIOpen = false;
objPlayer.spawnQueue = [];
objPlayer.summonTarget = undefined;
objPlayer.csh = false;

#define OnNPCUse

    objPlayer.mageUIOpen = true;
    
#define OnResourceSpawn(_inst)

    if (_inst.object_index == objRock and array_length(objPlayer.spawnQueue) > 0) {
        
        var _s = irandom_range(0, array_length(objPlayer.spawnQueue) - 1);
        var _spawn = objPlayer.spawnQueue[_s];
        
        var _ns = [];
        for (var i = 0; i < array_length(objPlayer.spawnQueue); i++) {
            
            if (i == _s) continue;
            
            _ns = array_push(_ns, objPlayer.spawnQueue[i]);
            
        }
        objPlayer.spawnQueue = _ns;
        
        with (_inst) {
            
            noDrops = true;
            sType = _spawn;
            
            switch (_spawn) {
                
                case ResSpawn.Cobalt:
                
                    sprite_index = global.Sprite_CobaltRock;
                
                break;
                
                case ResSpawn.Mythril:
                
                    sprite_index = global.Sprite_MythrilRock;
                
                break;
                
                case ResSpawn.Adamantite:
                
                    sprite_index = global.Sprite_AdamantiteRock;
                
                break;
                
                case ResSpawn.Luminite:
                
                    sprite_index = global.Sprite_LuminiteRock;
                
                break;
                
                case ResSpawn.EnergyBush:
                
                    sprite_index = global.Sprite_EnergyBush;
                
                break;
                
            }
            
        }
        
    }

#define OnResourceDestroy(_inst)

    if (variable_instance_exists(_inst, "sType")) {
        
        switch (_inst.sType) {
            
            case ResSpawn.Cobalt:
            
                DropItem(_inst.x, _inst.y, global.Item_CobaltOre, irandom_range(3, 5));
            
            break;
            
            case ResSpawn.Mythril:
            
                DropItem(_inst.x, _inst.y, global.Item_MythrilOre, irandom_range(2, 4));
            
            break;
            
            case ResSpawn.Adamantite:
            
                DropItem(_inst.x, _inst.y, global.Item_AdamantiteOre, irandom_range(1, 3));
            
            break;
            
            case ResSpawn.Luminite:
            
                DropItem(_inst.x, _inst.y, global.Item_LuminiteOre, irandom_range(1, 2));
            
            break;
            
            case ResSpawn.EnergyBush:
            
                DropItem(_inst.x, _inst.y, Item.Wood, irandom_range(1, 2));
            
            break;
        
        }
        
    }
    
#define OnDig(_x, _y)

    if (objPlayer.csh) {
     
        if (irandom_range(1, 2))   DropItem(_x, _y, global.Item_Lunite,        irandom_range(1, 3));
        if (irandom_range(1, 5))   DropItem(_x, _y, global.Item_CobaltOre,     irandom_range(1, 2));
        if (irandom_range(1, 10))   DropItem(_x, _y, global.Item_MythrilOre,    irandom_range(1, 2));
        if (irandom_range(1, 10))  DropItem(_x, _y, global.Item_AdamantiteOre, irandom_range(1, 2));
        if (irandom_range(1, 15))  DropItem(_x, _y, global.Item_LuminiteOre,   1);
        
    }