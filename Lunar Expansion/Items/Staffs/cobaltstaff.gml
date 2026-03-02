#define UseCobaltStaff

    if ((objPlayer.energyMax - objPlayer.summonEnergy) - 25 > 0) {
        
        objPlayer.summonEnergy += 25;
        
        SummonSpawn(global.Summon_MoonlitOrb);
        
    }
    
#define MoonlitOrbStepEvent

    if (x == xTo and y == yTo) {
        
        xTo = irandom_range(objPlayer.x - 20, objPlayer.y + 20);
        yTo = irandom_range(objPlayer.y - 20, objPlayer.y + 20);
        
    } else {
        
        if (x != xTo) x += sign(xTo - x) * 1;
        if (y != yTo) y += sign(yTo - y) * 1;
        
        if (abs(x - xTo) <= 1) x = xTo;
        if (abs(y - yTo) <= 1) y = yTo;
        
    }
    
    if (timer == 0) {
        
        if (!is_undefined(objPlayer.summonTarget)) {
            
            if (instance_exists(objPlayer.summonTarget)) {
                
                timer = 60;
                
                var _proj = ModObjectSpawn(x, y, -10000);
            
                with (_proj) {
                
                    sprite_index = global.Sprite_MoonlitProj;
                    
                    var _target = objPlayer.summonTarget
                    
                    direction = point_direction(x, y, _target.x, _target.y);
                    speed = 3;
                    
                    dmg = other.dmg;
                    
                }
                
                InstanceAssignMethod(_proj, "step", ScriptWrap(SummonProjectileStep), true);
                
            } else {
                
                objPlayer.summonTarget = undefined;
                
            }
            
        } else if (instance_exists(parEnemy)) {
            
            timer = 60;
            
            var _proj = ModObjectSpawn(x, y, -10000);
            
            with (_proj) {
                
                sprite_index = global.Sprite_MoonlitProj;
                
                var _target = instance_nearest(x, y, parEnemy);
                
                direction = point_direction(x, y, _target.x, _target.y);
                speed = 3;
                
                dmg = other.dmg;
                
            }
            
            InstanceAssignMethod(_proj, "step", ScriptWrap(SummonProjectileStep), true);
            
        } else if (instance_exists(parNatural)) {
            
            timer = 60;
            
            var _proj = ModObjectSpawn(x, y, -10000);
            
            with (_proj) {
                
                sprite_index = global.Sprite_MoonlitProj;
                
                var _target = instance_nearest(x, y, parNatural);
                
                direction = point_direction(x, y, _target.x, _target.y);
                speed = 3;
                
                dmg = other.dmg;
                
            }
            
            InstanceAssignMethod(_proj, "step", ScriptWrap(SummonProjectileStep), true);
            
        }
        
    } else {
     
        timer--;
        
    }