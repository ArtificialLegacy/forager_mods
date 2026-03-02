#define UseMythrilStaff

    if ((objPlayer.energyMax - objPlayer.summonEnergy) - 30 > 0) {
        
        objPlayer.summonEnergy += 30;
        
        SummonSpawn(global.Summon_LunarPrism);
        
    }
    
#define LunarPrismStepEvent

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
    
        if (instance_exists(parEnemy)) {
            
            timer = 120;
            
            var _target = instance_nearest(x, y, parEnemy);
            
            var _dir = point_direction(x, y, _target.x, _target.y);
            
            var _inst = ModObjectSpawn(x, y, -100000);
            
            with (_inst) {
                
                sprite_index = global.Sprite_LunarBeam;
                direction = _dir;
                image_angle = _dir + 90;
                dmg = other.dmg;
                image_yscale = 1000;
                
            }
            
            InstanceAssignMethod(_inst, "step", ScriptWrap(LunarBeamStepEvent), true);
            
        } else if (instance_exists(parNatural)) {
            
            timer = 120;
            
            var _target = instance_nearest(x, y, parNatural);
            
            var _dir = point_direction(x, y, _target.x, _target.y);
            
            var _inst = ModObjectSpawn(x, y, -100000);
            
            with (_inst) {
                
                sprite_index = global.Sprite_LunarBeam;
                direction = _dir;
                image_angle = _dir + 90;
                dmg = other.dmg;
                image_yscale = 1000;
                
            }
            
            InstanceAssignMethod(_inst, "step", ScriptWrap(LunarBeamStepEvent), true);
            
        }
        
    } else {
     
        timer--;
        
    }