#define UseLuminiteStaff

    if ((objPlayer.energyMax - objPlayer.summonEnergy) - 40 > 0) {
        
        objPlayer.summonEnergy += 40;
        
        SummonSpawn(global.Summon_LunarPillar);
        
    }

#define LunarPillarStepEvent

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