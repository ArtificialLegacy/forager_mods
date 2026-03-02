#define UseShuriken

    var _inst = ModObjectSpawn(objPlayer.x, objPlayer.y, -10000);
    
    with (_inst) {
        
        sprite_index = global.Sprite_Shuriken;
        direction = point_direction(x, y, mouse_x, mouse_y);
        speed = 3;
        
    }
    
    InstanceAssignMethod(_inst, "step", ScriptWrap(ShurikenProjectileStep), true);

    objPlayer.energy -= 2;
    
#define ShurikenProjectileStep

    image_angle += 10;
    
    if (distance_to_object(objPlayer) > 1000) {
        
        instance_destroy(self);
        
    } else {
    
        var _checkEnemy = instance_place(x, y, parEnemy);
        
        if (_checkEnemy != noone) {
            
            _checkEnemy.hp -= 2;
            
            instance_destroy(self);
            
        }
        
    }