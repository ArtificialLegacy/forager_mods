#define SpawnSlimeioNimbus()

    enum SlimeioNimbusStates {
        
        Float,
        LightningSpiralBegin,
        LightningSpiral,
        LightningCircle,
        LightningPlayer,
        
    }
    
    var _inst = ModObjectSpawn(objPlayer.x, objPlayer.y - 50, -10000);
    var _hitInst = instance_create_depth(_inst.x, _inst.y, _inst.depth, objSlime);
    _hitInst.hp = 50;
    _hitInst.visible = false;
    
    with (_inst) {
        
        state = SlimeioNimbusStates.Float;
        sprite_index = global.Sprite_SlimeioNimbusIdle;
        image_speed = 0.25;
        heightAboveShadow = 0;
        
        hitInst = _hitInst;
        
        moveToX = x;
        moveToY = y;
        
        spiralAngle = 0;
        spiralCharge = 0;
        
        circleCharge = 0;
        
        playerCharges = [];
        playerCooldown = 0;
        playerCircles = 0;
        playerCircleCount = 0;
    
    }
    
    InstanceAssignMethod(_inst, "step", ScriptWrap(SlimeioNimbusStep), false);
    InstanceAssignMethod(_inst, "draw", ScriptWrap(SlimeioNimbusDraw), false);
    InstanceAssignMethod(_inst, "drawGUI", ScriptWrap(SlimeioNimbusDrawGUI), true);

#define SlimeioNimbusStep
    
    if (!instance_exists(hitInst)) {
        
        DropItem(x, y, Item.Jelly, 1);
        
        TraceColored("Slimeio Nimbus has been defeated!", c_green);
        
        SetSaveKey("slimeio_nimbus_active", false);
        
        instance_destroy(hitInst, false);
        instance_destroy(self);
        
    } else {
        
        hitInst.x = x;
        hitInst.y = y;
        
        switch (state) {
            
            case SlimeioNimbusStates.Float:
            
                if ((x == moveToX and y == moveToY) or point_distance(x, y, moveToX, moveToY) < 2) {
                    
                    switch (irandom_range(0, 5)) {
                        
                        case 3:
                        
                            state = SlimeioNimbusStates.LightningSpiralBegin;
                            
                            spiralAngle = irandom_range(0, 360);
                            spiralCharge = 0;
                        
                        break;
                        
                        case 4:
                        
                            state = SlimeioNimbusStates.LightningCircle;
                            
                            circleCharge = 0;
                        
                        break;
                        
                        case 5:
                        
                            state = SlimeioNimbusStates.LightningPlayer;
                            
                            playerCharges = [];
                            playerCooldown = 0;
                            playerCircles = 0;
                            playerCircleCount = irandom_range(10, 20);
                        
                        break;
                        
                        default:
                        
                            moveToX = objPlayer.x + irandom_range(-100, 100);
                            moveToY = objPlayer.y + irandom_range(-100, 100);
                        
                    }
                    
                } else {
                
                    if (x != moveToX) {
                        
                        x += sign(moveToX - x);
                        
                    }
                    
                    if (y != moveToY) {
                        
                        y += sign(moveToY - y);
                        
                    }
                    
                }
            
            break;
            
            case SlimeioNimbusStates.LightningSpiralBegin:
            
                spiralCharge++;
                
                if (spiralCharge >= 120) {
                    
                    state = SlimeioNimbusStates.LightningSpiral;
                    
                }
            
            break;
            
            case SlimeioNimbusStates.LightningSpiral:
            
                for (var i = 0; i < 8; i++) {
                    
                    var _lastPos = [x, y];
                    
                    for (var z = 0; z < 10; z++) {
                        
                        var _dir = 10 * z + 10 + 45 * i + spiralAngle;
                        
                        var _newX = _lastPos[0] + lengthdir_x(20, _dir);
                        var _newY = _lastPos[1] + lengthdir_y(20, _dir);
                        
                        var _inst = instance_create_depth(_newX, _newY, -10000, objLightning);
                        
                        if (point_distance(_newX, _newY, objPlayer.x, objPlayer.y) < 10) {
                            
                            objPlayer.hp--;
                            
                        }
                        
                        _lastPos = [_newX, _newY];
                        
                    }
                    
                }
                
                state = SlimeioNimbusStates.Float;
            
            break;
            
            case SlimeioNimbusStates.LightningCircle:
            
                if (circleCharge < 270) circleCharge++;
                
                for (var i = 0; i < 5; i++) {
                    
                    if (circleCharge - 30 * i == 120) {
                    
                        for (var z = 0; z < 20; z++) {
                            
                            var _dir = z * 18;
                            
                            var _x = x + lengthdir_x(50 * i + 30, _dir);
                            var _y = y + lengthdir_y(50 * i + 30, _dir);
                            
                            var _inst = instance_create_depth(_x, _y, -10000, objLightning);
                            
                            if (point_distance(_x, _y, objPlayer.x, objPlayer.y) < 10) {
                                
                                objPlayer.hp--;
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
                if (circleCharge == 270) {
                    
                    state = SlimeioNimbusStates.Float;
                    
                }
            
            break;
            
            case SlimeioNimbusStates.LightningPlayer:
            
                if (playerCooldown < 60) playerCooldown++;
                
                if (playerCooldown >= 60) {
                    
                    playerCooldown = 0;
                    
                    playerCharges = array_push(playerCharges, [0, objPlayer.x, objPlayer.y]);
                    
                    playerCircles++;
                    
                    if (playerCircles >= playerCircleCount) {
                        
                        state = SlimeioNimbusStates.Float;
                        
                    }
                    
                }
                
                for (var i = 0; i < array_length(playerCharges); i++) {
                    
                    if (is_array(playerCharges[i])) {
                    
                        if (playerCharges[i][@0] < 30) playerCharges[i][@0]++;
                        
                        if (playerCharges[i][@0] >= 30) {
                            
                            var _x = playerCharges[i][@1];
                            var _y = playerCharges[i][@2];
                            
                            var _inst = instance_create_depth(_x, _y, -10000, objLightning);
                            
                            if (point_distance(_x, _y, objPlayer.x, objPlayer.y) < 10) {
                                
                                objPlayer.hp--;
                                
                            }
                            
                            playerCharges = array_remove(playerCharges, i);
                            i--;
                            
                        }
                        
                    }
                    
                }
            
            break;
            
        }
        
    }
    
#define SlimeioNimbusDraw
    
    draw_self();

    draw_sprite(sprShadow, 0, x, y + heightAboveShadow);
    
    switch (state) {
        
        case SlimeioNimbusStates.LightningSpiralBegin:
        
            for (var i = 0; i < 8; i++) {
                
                var _lastPos = [x, y];
                
                for (var z = 0; z < 10; z++) {
                    
                    var _dir = 10 * z + 10 + 45 * i + spiralAngle;
                    
                    var _newX = _lastPos[0] + lengthdir_x(20, _dir);
                    var _newY = _lastPos[1] + lengthdir_y(20, _dir);
                    
                    if (spiralCharge > 10 * z) {
                    
                        draw_set_alpha(spiralCharge / (120 - 10 * z));
                        
                        draw_circle_color(_newX, _newY, (spiralCharge / 120) * 5, c_red, c_red, false);
                        
                        draw_set_alpha(1);
                        
                    }
                    
                    _lastPos = [_newX, _newY];
                    
                }
                
            }
        
        break;
        
        case SlimeioNimbusStates.LightningCircle:
        
            for (var i = 0; i < 5; i++) {
                
                if (circleCharge > 30 * i and circleCharge - 30 * i < 120) {
                
                    for (var z = 0; z < 20; z++) {
                        
                        var _dir = z * 18;
                        
                        var _x = x + lengthdir_x(50 * i + 30, _dir);
                        var _y = y + lengthdir_y(50 * i + 30, _dir);
                        
                        draw_set_alpha((circleCharge - 30 * i) / 120);
                        
                        draw_circle_color(_x, _y, 5, c_red, c_red, false);
                        
                        draw_set_alpha(1);
                        
                    }
                
                }
                
            }
        
        break;
        
        case SlimeioNimbusStates.LightningPlayer:
        
            for (var i = 0; i < array_length(playerCharges); i++) {
                
                draw_set_alpha(playerCharges[i][@0] / 30);
                        
                draw_circle_color(playerCharges[i][@1], playerCharges[i][@2], 5, c_red, c_red, false);
                
                draw_set_alpha(1);
                
            }
        
        break;
        
    }
    
#define SlimeioNimbusDrawGUI

    if (instance_exists(hitInst)) {
    
        draw_set_halign(fa_center);
        
        draw_set_color(c_white);
        
        draw_text_transformed(window_get_width() div 2, window_get_height() - 120, "slimeio nimbus", 2, 2, 0);
        draw_rectangle_color(window_get_width() div 2 - 202, window_get_height() - 100, window_get_width() div 2 + 202, window_get_height() - 85, c_black, c_black, c_black, c_black, false);
        draw_rectangle_color(window_get_width() div 2 - 200, window_get_height() - 98, (window_get_width() div 2 - 200) + (400 * (hitInst.hp / 50)), window_get_height() - 87, c_red, c_red, c_red, c_red, false);
        
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        
    }