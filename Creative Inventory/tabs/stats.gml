#define DrawStatsTab(_menu)

    var _stats = surface_create(600, 550);
    
    surface_set_target(_stats);
    
    draw_clear_alpha(c_black, 0);
    
    draw_set_halign(fa_left);
    
    draw_text(20, 30, "health:");
    draw_rectangle_color(160, 10, 180, 30, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(172, 30, "-");
    if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 10 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 30 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(160, 10, 180, 30, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    draw_set_halign(fa_center);
    draw_text(220, 30, string(objPlayer.hpMax));
    draw_set_halign(fa_left);
    draw_rectangle_color(240, 10, 260, 30, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(252, 30, "+");
    if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 10 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 30 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(240, 10, 260, 30, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    draw_rectangle_color(270, 10, 290, 30, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(281, 30, "H");
    if (mouse_get_raw_x() > 270 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 290 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 10 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 30 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(270, 10, 290, 30, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    
    draw_text(310, 30, "invincible:");
    draw_rectangle_color(450, 10, 470, 30, c_gray, c_gray, c_gray, c_gray, true);
    if (objPlayer.invincible) {
        
        draw_rectangle_color(450, 10, 470, 30, c_lime, c_lime, c_lime, c_lime, false);
        
    }
    if (mouse_get_raw_x() > 450 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 470 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 10 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 30 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(450, 10, 470, 30, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    
    draw_text(20, 60, "stamina:");
    draw_rectangle_color(160, 40, 180, 60, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(172, 60, "-");
    if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 40 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 60 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(160, 40, 180, 60, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    draw_set_halign(fa_center);
    draw_text(220, 60, string(objPlayer.energyMax));
    draw_set_halign(fa_left);
    draw_rectangle_color(240, 40, 260, 60, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(252, 60, "+");
    if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 40 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 60 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(240, 40, 260, 60, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    draw_rectangle_color(270, 40, 290, 60, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(281, 60, "H");
    if (mouse_get_raw_x() > 270 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 290 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 40 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 60 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(270, 40, 290, 60, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    
    draw_text(20, 90, "backpack:");
    draw_rectangle_color(160, 70, 180, 90, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(172, 90, "-");
    if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 70 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 90 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(160, 70, 180, 90, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    draw_set_halign(fa_center);
    draw_text(220, 90, string(objPlayer.inventorySize));
    draw_set_halign(fa_left);
    draw_rectangle_color(240, 70, 260, 90, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(252, 90, "+");
    if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 70 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 90 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(240, 70, 260, 90, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    
    draw_text(20, 120, "level:");
    draw_rectangle_color(160, 100, 180, 120, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(172, 120, "-");
    if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 100 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 120 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(160, 100, 180, 120, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    draw_set_halign(fa_center);
    draw_text(220, 120, string(objPlayer.level));
    draw_set_halign(fa_left);
    draw_rectangle_color(240, 100, 260, 120, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(252, 120, "+");
    if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 100 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 120 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(240, 100, 260, 120, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    
    draw_text(20, 150, "xp:");
    draw_rectangle_color(160, 130, 180, 150, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(172, 150, "-");
    if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 130 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 150 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(160, 130, 180, 150, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    draw_set_halign(fa_center);
    draw_text(220, 150, string(floor((objPlayer.xp / objPlayer.xpCap) * 100)));
    draw_set_halign(fa_left);
    draw_rectangle_color(240, 130, 260, 150, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(252, 150, "+");
    if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 130 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 150 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(240, 130, 260, 150, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    
    draw_text(20, 180, "skills:");
    draw_rectangle_color(160, 160, 180, 180, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(172, 180, "-");
    if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 160 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 180 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(160, 160, 180, 180, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    draw_set_halign(fa_center);
    draw_text(220, 180, string(objPlayer.skills));
    draw_set_halign(fa_left);
    draw_rectangle_color(240, 160, 260, 180, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(252, 180, "+");
    if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 160 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 180 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(240, 160, 260, 180, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    
    
    draw_text(20, 210, "damage:");
    draw_rectangle_color(160, 190, 180, 210, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(172, 210, "-");
    if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 190 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 210 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(160, 190, 180, 210, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    draw_set_halign(fa_center);
    draw_text(220, 210, string(objPlayer.dmg));
    draw_set_halign(fa_left);
    draw_rectangle_color(240, 190, 260, 210, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(252, 210, "+");
    if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 190 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 210 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(240, 190, 260, 210, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    
    draw_text(20, 240, "speed:");
    draw_rectangle_color(160, 220, 180, 240, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(172, 240, "-");
    if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 220 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 240 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(160, 220, 180, 240, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    draw_set_halign(fa_center);
    draw_text(220, 240, string(objPlayer.maxSpd));
    draw_set_halign(fa_left);
    draw_rectangle_color(240, 220, 260, 240, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(252, 240, "+");
    if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 220 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 240 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(240, 220, 260, 240, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    
    draw_text(20, 280, "gridsnap: ");
    draw_rectangle_color(160, 260, 180, 280, c_gray, c_gray, c_gray, c_gray, true);
    if (global.gridSnap) {
        
        draw_rectangle_color(160, 260, 180, 280, c_lime, c_lime, c_lime, c_lime, false);
        
    }
    if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 260 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 280 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(160, 260, 180, 280, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    
    draw_text(20, 310, "increment:");
    draw_rectangle_color(160, 290, 180, 310, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(172, 310, "-");
    if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 290 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 310 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(160, 290, 180, 310, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    draw_set_halign(fa_center);
    draw_text(220, 310, string(global.itemIncrements[global.itemIncrement][0]));
    draw_set_halign(fa_left);
    draw_rectangle_color(240, 290, 260, 310, c_gray, c_gray, c_gray, c_gray, true);
    draw_text(252, 310, "+");
    if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 290 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 310 + global.CreativeMenuPos[1] + 50) {
        
        draw_set_alpha(0.5);
        draw_rectangle_color(240, 290, 260, 310, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_set_alpha(1);
        
    }
    
    surface_reset_target();
    
    surface_set_target(_menu);

    draw_set_alpha(1);

    draw_surface(_stats, 0, 50);

    surface_reset_target();
    
    surface_free(_stats);
    
#define StepStatsTab

    if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 10 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 30 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.hpMax > 1) {
            
            objPlayer.hpMax--;
            objPlayer.hp = objPlayer.hpMax;
            
        }
    
    } else if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 10 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 30 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.hpMax < 18) {
            
            objPlayer.hpMax++;
            objPlayer.hp = objPlayer.hpMax;
            
        }
    
    } else if (mouse_get_raw_x() > 270 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 290 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 10 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 30 + global.CreativeMenuPos[1] + 50) {
    
        objPlayer.hp = objPlayer.hpMax;
    
    } else if (mouse_get_raw_x() > 450 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 470 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 10 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 30 + global.CreativeMenuPos[1] + 50) {
        
        objPlayer.invincible = !objPlayer.invincible;
        
    } else if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 40 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 60 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.energyMax > 10) {
            
            objPlayer.energyMax--;
            objPlayer.energy = objPlayer.energyMax;
            
        }
    
    } else if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 40 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 60 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.energyMax < 300) {
            
            objPlayer.energyMax++;
            objPlayer.energy = objPlayer.energyMax;
            
        }
    
    } else if (mouse_get_raw_x() > 270 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 290 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 40 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 60 + global.CreativeMenuPos[1] + 50) {
    
        objPlayer.energy = objPlayer.energyMax;
    
    } else if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 70 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 90 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.inventorySize > 1) {
            
            objPlayer.inventorySize--;
            
        }
    
    } else if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 70 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 90 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.inventorySize < 40) {
            
            objPlayer.inventorySize++;
            
        }
    
    } else if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 100 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 120 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.level > 0) {
            
            objPlayer.level--;
            objPlayer.xp = 0;
            
        }
    
    } else if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 100 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 120 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.level < 65) {
            
            objPlayer.level++;
            
        }
    
    } else if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 130 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 150 + global.CreativeMenuPos[1] + 50) {
    
        if (floor((objPlayer.xp / objPlayer.xpCap) * 100) > 0) {
    
            objPlayer.xp = floor(objPlayer.xpCap * ((objPlayer.xp / objPlayer.xpCap) - 0.01));
            objPlayer.xpToGain = objPlayer.xp;
            
        }
    
    } else if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 130 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 150 + global.CreativeMenuPos[1] + 50) {
    
        if (floor((objPlayer.xp / objPlayer.xpCap) * 100) < 99) {
    
            objPlayer.xp = ceil(objPlayer.xpCap * ((objPlayer.xp / objPlayer.xpCap) + 0.01));
            objPlayer.xpToGain = objPlayer.xp;
            
        }
    
    } else if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 160 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 180 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.skills > 0) objPlayer.skills--;
    
    } else if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 160 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 180 + global.CreativeMenuPos[1] + 50) {
    
        objPlayer.skills++;
    
    } else if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 190 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 210 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.wrath > 0) {
            
            objPlayer.wrath -= 0.25;
            
        }
    
    } else if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 190 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 210 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.wrath < 24) {
            
            objPlayer.wrath += 0.25;
            
        }
    
    } else if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 220 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 240 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.maxSpd > -0.9) {
            
            objPlayer.maxSpd -= 0.1;
            
        } else {
            
            objPlayer.maxSpd = -1;
            
        }
    
    } else if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 220 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 240 + global.CreativeMenuPos[1] + 50) {
    
        if (objPlayer.maxSpd < 5) {
            
            objPlayer.maxSpd += 0.1;
            
        } else {
            
            objPlayer.maxSpd = 5;
            
        }
    
    } else if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 260 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 280 + global.CreativeMenuPos[1] + 50) {
    
        global.gridSnap = !global.gridSnap;
    
    } else if (mouse_get_raw_x() > 160 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 180 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 290 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 310 + global.CreativeMenuPos[1] + 50) {
        
        if (global.itemIncrement > 0) {
            
            global.itemIncrement--;
            
        }
        
    } else if (mouse_get_raw_x() > 240 + global.CreativeMenuPos[0] and mouse_get_raw_x() < 260 + global.CreativeMenuPos[0] and mouse_get_raw_y() > 290 + global.CreativeMenuPos[1] + 50 and mouse_get_raw_y() < 310 + global.CreativeMenuPos[1] + 50) {
    
        if (global.itemIncrement < array_length(global.itemIncrements) - 1) {
            
            global.itemIncrement++;
            
        }
    
    }