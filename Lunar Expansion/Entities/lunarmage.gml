#define UseLunarSigil

    var _inst = ModNPCSpawn(mouse_x, mouse_y, -10000, global.NPC_LunarMage);
    
    with (_inst) {
        
        sprite_index = sprKey;
        NPCSetQuest("Dialogue");
        NPCSetState("talk1");
        
    }
    
#define DrawLunarMageMenu

    draw_set_alpha(0.5);
    
    draw_rectangle_color((window_get_width() div 2) - 42, 100, (window_get_width() div 2) + 42, window_get_height() - 100,   c_ltgray, c_ltgray, c_gray,  c_gray,  false);
    draw_rectangle_color((window_get_width() div 2) - 42, 100, (window_get_width() div 2) + 42, window_get_height() - 100,   c_black,  c_black,  c_black, c_black, true);
    draw_rectangle_color((window_get_width() div 2) - 41, 101, (window_get_width() div 2) + 41, window_get_height() - 101,   c_black,  c_black,  c_black, c_black, true);
    
    draw_set_alpha(0.75);
    
    var _cobalt = 0;
    var _mythril = 0;
    var _adamantite = 0;
    var _luminite = 0;
    var _energy = 0;
    
    for (var i = 0; i < array_length(objPlayer.spawnQueue); i++) {
        
        switch (objPlayer.spawnQueue[i]) {
            
            case ResSpawn.Cobalt: _cobalt++; break;
            case ResSpawn.Mythril: _mythril++; break;
            case ResSpawn.Adamantite: _adamantite++; break;
            case ResSpawn.Luminite: _luminite++; break;
            case ResSpawn.EnergyBush: _energy++; break;
            
        }
        
    }
    
    draw_rectangle_color(110, 110, 174, 174, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
    draw_rectangle_color(110, 110, 174, 174, c_black, c_black, c_black, c_black, true);
    draw_sprite_ext(global.Sprite_CobaltRock, 0, 142, 142, 3, 3, 0, c_white, 1);
    draw_sprite_ext(global.Sprite_LunarSoul, 0, 125, 174, 1, 1, 0, c_white, 1);
    draw_text(159, 183, "10");
    draw_set_halign(fa_right);
    draw_text(190, 120, string(_cobalt));
    draw_set_halign(fa_center);
    if (window_mouse_get_x() > 110 and window_mouse_get_x() < 174 and window_mouse_get_y() > 110 and window_mouse_get_y() < 174) {
        draw_set_alpha(0.1);
        draw_rectangle_color(110, 110, 174, 174, c_white, c_white, c_white, c_white, false);
        draw_set_alpha(0.75);
    }
    
    draw_rectangle_color(184, 110, 248, 174, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
    draw_rectangle_color(184, 110, 248, 174, c_black, c_black, c_black, c_black, true);
    draw_sprite_ext(global.Sprite_MythrilRock, 0, 216, 142, 3, 3, 0, c_white, 1);
    draw_sprite_ext(global.Sprite_LunarSoul, 0, 199, 174, 1, 1, 0, c_white, 1);
    draw_text(233, 183, "20");
    draw_set_halign(fa_right);
    draw_text(260, 120, string(_mythril));
    draw_set_halign(fa_center);
    if (window_mouse_get_x() > 184 and window_mouse_get_x() < 248 and window_mouse_get_y() > 110 and window_mouse_get_y() < 174) {
        draw_set_alpha(0.1);
        draw_rectangle_color(184, 110, 248, 174, c_white, c_white, c_white, c_white, false);
        draw_set_alpha(0.75);
    }
    
    draw_rectangle_color(258, 110, 322, 174, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
    draw_rectangle_color(258, 110, 322, 174, c_black, c_black, c_black, c_black, true);
    draw_sprite_ext(global.Sprite_AdamantiteRock, 0, 290, 142, 3, 3, 0, c_white, 1);
    draw_sprite_ext(global.Sprite_LunarSoul, 0, 273, 174, 1, 1, 0, c_white, 1);
    draw_text(307, 183, "30");
    draw_set_halign(fa_right);
    draw_text(330, 120, string(_adamantite));
    draw_set_halign(fa_center);
    if (window_mouse_get_x() > 258 and window_mouse_get_x() < 322 and window_mouse_get_y() > 110 and window_mouse_get_y() < 174) {
        draw_set_alpha(0.1);
        draw_rectangle_color(258, 110, 322, 174, c_white, c_white, c_white, c_white, false);
        draw_set_alpha(0.75);
    }
    
    draw_rectangle_color(332, 110, 396, 174, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
    draw_rectangle_color(332, 110, 396, 174, c_black, c_black, c_black, c_black, true);
    draw_sprite_ext(global.Sprite_LuminiteRock, 0, 365, 142, 3, 3, 0, c_white, 1);
    draw_sprite_ext(global.Sprite_LunarSoul, 0, 348, 174, 1, 1, 0, c_white, 1);
    draw_text(382, 183, "40");
    draw_set_halign(fa_right);
    draw_text(400, 120, string(_luminite));
    draw_set_halign(fa_center);
    if (window_mouse_get_x() > 332 and window_mouse_get_x() < 396 and window_mouse_get_y() > 110 and window_mouse_get_y() < 174) {
        draw_set_alpha(0.1);
        draw_rectangle_color(332, 110, 396, 174, c_white, c_white, c_white, c_white, false);
        draw_set_alpha(0.75);
    }
    
    draw_rectangle_color(110, 184, 174, 248, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
    draw_rectangle_color(110, 184, 174, 248, c_black, c_black, c_black, c_black, true);
    draw_sprite_ext(global.Sprite_EnergyBush, 0, 142, 212, 3, 3, 0, c_white, 1);
    draw_sprite_ext(global.Sprite_LunarSoul, 0, 125, 249, 1, 1, 0, c_white, 1);
    draw_text(159, 258, "25");
    draw_set_halign(fa_right);
    draw_text(190, 190, string(_energy));
    draw_set_halign(fa_center);
    if (window_mouse_get_x() > 110 and window_mouse_get_x() < 174 and window_mouse_get_y() > 184 and window_mouse_get_y() < 248) {
        draw_set_alpha(0.1);
        draw_rectangle_color(110, 184, 174, 248, c_white, c_white, c_white, c_white, false);
        draw_set_alpha(0.75);
    }

    draw_set_alpha(1);
    
#define InteractLunarMageMenu

    if (window_mouse_get_x() > 110 and window_mouse_get_x() < 174 and window_mouse_get_y() > 110 and window_mouse_get_y() < 174) {
        
        if (ItemCount(global.Item_LunarSoul, false) >= 10) {
            
            RemoveItem(global.Item_LunarSoul, 10);
            objPlayer.spawnQueue = array_push(objPlayer.spawnQueue, ResSpawn.Cobalt);
            
        }
        
    } else if (window_mouse_get_x() > 184 and window_mouse_get_x() < 248 and window_mouse_get_y() > 110 and window_mouse_get_y() < 174) {
        
        if (ItemCount(global.Item_LunarSoul, false) >= 20) {
            
            RemoveItem(global.Item_LunarSoul, 20);
            objPlayer.spawnQueue = array_push(objPlayer.spawnQueue, ResSpawn.Mythril);
            
        }
        
    } else if (window_mouse_get_x() > 258 and window_mouse_get_x() < 322 and window_mouse_get_y() > 110 and window_mouse_get_y() < 174) {
        
        if (ItemCount(global.Item_LunarSoul, false) >= 30) {
            
            RemoveItem(global.Item_LunarSoul, 30);
            objPlayer.spawnQueue = array_push(objPlayer.spawnQueue, ResSpawn.Adamantite);
            
        }
        
    } else if (window_mouse_get_x() > 332 and window_mouse_get_x() < 396 and window_mouse_get_y() > 110 and window_mouse_get_y() < 174) {
        
        if (ItemCount(global.Item_LunarSoul, false) >= 40) {
            
            RemoveItem(global.Item_LunarSoul, 40);
            objPlayer.spawnQueue = array_push(objPlayer.spawnQueue, ResSpawn.Luminite);
            
        }
        
    } else if (window_mouse_get_x() > 110 and window_mouse_get_x() < 174 and window_mouse_get_y() > 184 and window_mouse_get_y() < 248) {
        
        if (ItemCount(global.Item_LunarSoul, false) >= 25) {
            
            RemoveItem(global.Item_LunarSoul, 25);
            objPlayer.spawnQueue = array_push(objPlayer.spawnQueue, ResSpawn.EnergyBush);
            
        }
        
    }