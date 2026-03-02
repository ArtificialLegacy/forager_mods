#define OnStep

    if (mouse_check_button_pressed(mb_left)) {
        
        with (instance_position(mouse_x, mouse_y, parStructure)) {
            
            if (isNode) {
                
                switch (nodeType) {
                    
                    case "BUTTON":
                        
                        state = true;
                        
                        sprite_index = buttonSpriteOn;
                        
                    break;
                    
                    case "SWITCH":
                    
                        if (toggle) {
                            state = false;
                            sprite_index = switchSpriteOff;
                        } else {
                            state = true;
                            sprite_index = switchSpriteOn;
                        }
                        
                        toggle = !toggle;
                    
                    break;
                    
                }
                
            }
            
        }
        
    }

#define OnSystemStep

    if (room != rmGame) return;
    
    TryLoad();

    with (parStructure) {
        
        if (!variable_instance_exists(id, "isNode")) return;
        
        if (isNode) {
            
            switch (nodeType) {
                
                case "NOT":
                    var _none = true;
                    
                    for (i = 0; i < array_length(inputs); i++) {
                        
                        var _i = inputs[i];
                        
                        if (_i.state) {
                            _none = false;
                            break;
                        }
                    }
                    
                    if (_none) {
                        
                        state = true;
                        
                        sprite_index = notSpriteOn;
                        
                    } else {
                        state = false;
                        
                        sprite_index = notSpriteOff;
                    }
                
                break;
                
                case "OR":
                
                    var _any = false;
                    
                    for (i = 0; i < array_length(inputs); i++) {
                        
                        var _i = inputs[i];
                        
                        
                        if (_i.state) {
                            _any = true;
                            break;
                        }
                    }
                    
                    if (_any) {
                        
                        state = true;
                        
                        sprite_index = orSpriteOn;
                        
                    } else {
                        state = false;
                        
                        sprite_index = orSpriteOff;
                    }
                
                break;
                
                case "AND":
                
                    var _all = true;
                    
                    if (array_length(inputs) == 0) _all = false;
                    
                    for (i = 0; i < array_length(inputs); i++) {
                        
                        var _i = inputs[i];
                        
                        
                        if (!_i.state) {
                            _all = false;
                            break;
                        }
                    }
                    
                    if (_all) {
                        
                        state = true;
                        
                        sprite_index = andSpriteOn;
                        
                    } else {
                        state = false;
                        
                        sprite_index = andSpriteOff;
                    }
                
                break;
                
                case "XOR":
                
                    var _count = 0;
                    
                    for (i = 0; i < array_length(inputs); i++) {
                        
                        var _i = inputs[i];
                        
                        
                        if (_i.state) {
                            _count++;
                        }
                    }
                    
                    if (_count == 1) {
                        
                        state = true;
                        
                        sprite_index = xorSpriteOn;
                        
                    } else {
                        state = false;
                        
                        sprite_index = xorSpriteOff;
                    }
                
                break;
                
                case "NAND":
                
                    var _all = true;
                    
                    if (array_length(inputs) == 0) _all = false;
                    
                    for (i = 0; i < array_length(inputs); i++) {
                        
                        var _i = inputs[i];
                        
                        
                        if (!_i.state) {
                            _all = false;
                            break;
                        }
                    }
                    
                    if (_all) {
                        
                        state = false;
                        
                        sprite_index = nandSpriteOff;
                        
                    } else {
                        state = true;
                        
                        sprite_index = nandSpriteOn;
                    }
                
                break;
                
                case "XNOR":
                
                    var _count = 0;
                    
                    for (i = 0; i < array_length(inputs); i++) {
                        
                        var _i = inputs[i];
                        
                        
                        if (_i.state) {
                            _count++;
                        }
                    }
                    
                    if (_count == 1) {
                        
                        state = false;
                        
                        sprite_index = xnorSpriteOff;
                        
                    } else {
                        state = true;
                        
                        sprite_index = xnorSpriteOn;
                    }
                
                break;
                
                case "MONO":
                
                    var _any = false;
                    
                    for (i = 0; i < array_length(inputs); i++) {
                        
                        var _i = inputs[i];
                        
                        
                        if (_i.state) {
                            _any = true;
                            break;
                        }
                    }
                    
                    if (_any) {
                        
                        if (!pop) {
                            state = true;
                            sprite_index = monoSpriteOn;
                        } else {
                            state = false;
                            sprite_index = monoSpriteOff;
                        }
                        
                        pop = true;
                        
                    } else {
                        state = false;
                        
                        sprite_index = monoSpriteOff;
                    }
                
                break;
                
                case "LIGHT":
                
                    var _any = false;
                    
                    for (i = 0; i < array_length(inputs); i++) {
                        
                        var _i = inputs[i];
                        
                        
                        if (_i.state) {
                            _any = true;
                            break;
                        }
                    }
                    
                    if (_any) {
                        
                        sprite_index = lightSpriteOn;
                        
                        GlowOrderCreate(id, 0.1, c_aqua);
                        
                    } else {
                        
                        sprite_index = lightSpriteOff;
                        
                        GlowOrderRemove(id);
                        
                    }
                
                break;
                
                case "BUZZ":
                
                    var _any = false;
                    
                    for (i = 0; i < array_length(inputs); i++) {
                        
                        var _i = inputs[i];
                        
                        
                        if (_i.state) {
                            _any = true;
                            break;
                        }
                    }
                    
                    if (_any) {
                        
                        sprite_index = buzzerSpriteOn;
                        
                        audio_play_sound(sndElectricityLoop, 1, false);
                        
                    } else {
                        sprite_index = buzzerSpriteOff;
                    }
                
                break;
                
                case "CLOCK":
                
                    if (cycle) {
                        cycle = false;
                        state = true;
                        sprite_index = clockSpriteOn;
                    } else {
                        cycle = true;
                        state = false;
                        sprite_index = clockSpriteOff;
                    }
                
                break;
                
                case "BUTTON":
                
                    state = false;
                    
                    sprite_index = buttonSpriteOff;
                
                break;
                
                case "PAD":
                    
                    if (place_meeting(x, y, objPlayer)) {
                        
                        state = true;
                        
                        sprite_index = padSpriteOn;
                        
                    } else {
                        state = false;
                        
                        sprite_index = padSpriteOff;
                    }
                    
                break;
                
                default:
                
                    for (var i = 0; i < array_length(mGates); i++) {
                        
                        if (nodeType == mGates[i][2]) ScriptCall(mGates[i][1]);
                        
                    }
            }
            
        }
        
    }