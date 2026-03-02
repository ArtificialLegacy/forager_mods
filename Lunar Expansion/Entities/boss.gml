#define BossSummonAnimation

    repeat(10) {
                        
        var _x = irandom_range(objPlayer.x - 200, objPlayer.x + 200);
        var _y = irandom_range(objPlayer.y - 200, objPlayer.y + 200);
        
        instance_create_depth(_x, _y, -10000, objLightning);
        
    }
    
    repeat(10) {
        
        var _x = irandom_range(objPlayer.x - 200, objPlayer.x + 200);
        var _y = irandom_range(objPlayer.y - 200, objPlayer.y + 200);
        
        var _inst = instance_create_depth(_x, _y, -10000, objExplosion);
        _inst.dmg = false;
        _inst.dmgPlayer = false;
        
    }
    
    repeat(300) {
        
        var _x = irandom_range(objPlayer.x - 200, objPlayer.x + 200);
        var _y = irandom_range(objPlayer.y - 200, objPlayer.y + 200);
        
        instance_create_depth(_x, _y, -10000, objSmoke);
        
    }