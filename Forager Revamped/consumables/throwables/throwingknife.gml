#define UseThrowingKnife

    var _inst = ModObjectSpawn(objPlayer.x, objPlayer.y, -10000);
    
    with (_inst) {
        
        sprite_index = global.Sprite_ThrowingKnife;
        direction = point_direction(x, y, mouse_x, mouse_y);
        image_angle = direction - 45;
        speed = 3;
        
    }
    
    InstanceAssignMethod(_inst, "step", ScriptWrap(ThrowingKnifeProjectileStep), true);

    objPlayer.energy -= 3;
    
#define ThrowingKnifeProjectileStep
    
    if (distance_to_object(objPlayer) > 1000) {
        
        instance_destroy(self);
        
    } else {
    
        var _checkEnemy = instance_place(x, y, parEnemy);
        
        if (_checkEnemy != noone) {
            
            _checkEnemy.hp -= 3;
            
            instance_destroy(self);
            
        }
        
    }