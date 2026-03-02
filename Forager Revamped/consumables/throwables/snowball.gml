#define UseSnowball

    var _inst = ModObjectSpawn(objPlayer.x, objPlayer.y, -10000);
    
    with (_inst) {
        
        sprite_index = global.Sprite_Snowball;
        direction = point_direction(x, y, mouse_x, mouse_y);
        speed = 3;
        
    }
    
    InstanceAssignMethod(_inst, "step", ScriptWrap(SnowballProjectileStep), true);

    
#define SnowballProjectileStep
    
    if (distance_to_object(objPlayer) > 1000) {
        
        instance_destroy(self);
        
    }