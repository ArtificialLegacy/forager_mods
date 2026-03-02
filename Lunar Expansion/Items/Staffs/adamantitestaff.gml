#define UseAdamantiteStaff

    if ((objPlayer.energyMax - objPlayer.summonEnergy) - 35 > 0) {
        
        objPlayer.summonEnergy += 35;
        
        SummonSpawn(global.Summon_CelestialImp);
        
    }

#define CelestialImpStepEvent

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
            
            timer = 60;
            
            var _proj = ModObjectSpawn(x, y, -10000);
            
            with (_proj) {
                
                sprite_index = global.Sprite_CelestialImpProj;
                
                var _target = instance_nearest(x, y, parEnemy);
                
                direction = point_direction(x, y, _target.x, _target.y);
                speed = 3;
                
                dmg = other.dmg;
                
            }
            
            InstanceAssignMethod(_proj, "step", ScriptWrap(SummonExplosiveProjectileStep), true);
            
        } else if (instance_exists(parNatural)) {
            
            timer = 60;
            
            var _proj = ModObjectSpawn(x, y, -10000);
            
            with (_proj) {
                
                sprite_index = global.Sprite_CelestialImpProj;
                
                var _target = instance_nearest(x, y, parNatural);
                
                direction = point_direction(x, y, _target.x, _target.y);
                speed = 3;
                
                dmg = other.dmg;
                
            }
            
            InstanceAssignMethod(_proj, "step", ScriptWrap(SummonExplosiveProjectileStep), true);
            
        }
        
    } else {
     
        timer--;
        
    }