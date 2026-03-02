#define DrawQuestGUI

    draw_set_alpha(0.5);
    
    draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
    
    draw_set_alpha(1)
    
    if (objPlayer.primaryQuest != noone) {
    
        draw_sprite_stretched(sprInventorySlot, 0, 200, 100, 100, 100);
        
        draw_sprite_stretched(objPlayer.primaryQuest[? "icon"], 0, 225, 125, 50, 50);
        
        draw_set_halign(fa_left);
        
        draw_text_transformed(320, 130, objPlayer.primaryQuest[? "name"], 1.5, 1.5, 0);
        draw_text_ext(318, 160, objPlayer.primaryQuest[? "description"], 20, 300);
        
        draw_set_halign(fa_center);
        
        draw_text_transformed(225, 110, string(objPlayer.primaryQuest[? "xp"]) + "EP", 1, 1, 45);
        
    }
    
    if (objPlayer.secondaryQuests[0] != noone) {
        
        draw_sprite_stretched(sprInventorySlot, 0, 200, 300, 100, 100);
        
        draw_sprite_stretched(objPlayer.secondaryQuests[0][? "icon"], 0, 225, 325, 50, 50);
        
        draw_set_halign(fa_left);
        
        draw_text_transformed(320, 330, objPlayer.secondaryQuests[0][? "name"], 1.5, 1.5, 0);
        draw_text_ext(318, 360, objPlayer.secondaryQuests[0][? "description"], 20, 400);
        
        draw_set_halign(fa_center);
        
        draw_text_transformed(225, 310, string(objPlayer.secondaryQuests[0][? "xp"]) + "EP", 1, 1, 45);
        
    }
    
    if (objPlayer.secondaryQuests[1] != noone) {
        
        draw_sprite_stretched(sprInventorySlot, 0, 200, 450, 100, 100);
        
        draw_sprite_stretched(objPlayer.secondaryQuests[1][? "icon"], 0, 225, 475, 50, 50);
        
        draw_set_halign(fa_left);
        
        draw_text_transformed(320, 480, objPlayer.secondaryQuests[1][? "name"], 1.5, 1.5, 0);
        draw_text_ext(318, 510, objPlayer.secondaryQuests[1][? "description"], 20, 400);
        
        draw_set_halign(fa_center);
        
        draw_text_transformed(225, 460, string(objPlayer.secondaryQuests[1][? "xp"]) + "EP", 1, 1, 45);
        
    }
    
    if (objPlayer.dailyQuest != noone) {
        
        draw_sprite_stretched(sprInventorySlot, 0, 700, 100, 100, 100);
        
        draw_sprite_stretched(objPlayer.dailyQuest[? "icon"], 0, 725, 125, 50, 50);
        
        draw_set_halign(fa_left);
        
        draw_text_transformed(820, 130, objPlayer.dailyQuest[? "name"], 1.5, 1.5, 0);
        draw_text_ext(818, 160, objPlayer.dailyQuest[? "description"], 20, 300);
        
        draw_set_halign(fa_center);
        
        draw_text_transformed(725, 110, string(objPlayer.dailyQuest[? "xp"]) + "EP", 1, 1, 45);
        
    }
    
    draw_set_alpha(1);

#define UpdateQuestGUI

    