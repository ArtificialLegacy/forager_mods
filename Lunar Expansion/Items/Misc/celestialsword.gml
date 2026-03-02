#define UseCelestialSword

objPlayer.energy -= 5;

var _dir = point_direction(objPlayer.x, objPlayer.y, mouse_x, mouse_y);
var _x = objPlayer.x + lengthdir_x(5, _dir);
var _y = objPlayer.y + lengthdir_y(5, _dir);

var _hitbox = ModObjectSpawn(_x, _y, 1000);
with (_hitbox) {
    
    sprite_index = global.Sprite_CelestialSwordHitbox;
    image_angle = _dir + 90;
    
}
InstanceAssignMethod(_hitbox, "step", ScriptWrap(CelestialSwordHitboxStep), true);

for (var i = 0; i < 5; i++) {
    
    var _heart = ModObjectSpawn(_x, _y, -1000000);
    with (_heart) {
        
        sprite_index = global.Sprite_CelestialSwordProj;
        image_angle = (_dir + 90) - 20 + 10 * i;
        direction = _dir - 20 + 10 * i;
        speed = 3;
        
    }
    InstanceAssignMethod(_heart, "step", ScriptWrap(CelestialSwordHeartStep), true);
    
}

#define CelestialSwordHitboxStep

    if (place_meeting(x, y, parEnemy)) {
        
        var _inst = instance_place(x, y, parEnemy);
        
        _inst.hp -= 30 + (objPlayer.dmg * objPlayer.wrath);
        var _ex = instance_create_depth(x, y, 0, objExplosion);
        _ex.dmgPlayer = false;
        
    } else if (instance_exists(parNatural)) {
    
        if (place_meeting(x, y, parNatural)) {
            
            var _inst = instance_place(x, y, parNatural);
            
            if (instance_exists(_inst)) {
            
                _inst.hp -= (objPlayer.dmg * objPlayer.wrath);
                var _ex = instance_create_depth(x, y, 0, objExplosion);
                _ex.dmgPlayer = false;
                
            }
            
        }
        
    }
    
    instance_destroy(self, true);

#define CelestialSwordHeartStep

    if (place_meeting(x, y, parEnemy)) {
        
        var _inst = instance_place(x, y, parEnemy);
        
        _inst.hp -= 30 + (objPlayer.dmg * objPlayer.wrath);
        var _ex = instance_create_depth(x, y, 0, objExplosion);
        _ex.dmgPlayer = false;
        
        instance_destroy(self, true);
        
    } else if (instance_exists(parNatural)) {
    
        if (place_meeting(x, y, parNatural)) {
            
            var _inst = instance_place(x, y, parNatural);
            
            if (instance_exists(_inst)) {
            
                _inst.hp -= (objPlayer.dmg * objPlayer.wrath);
                var _ex = instance_create_depth(x, y, 0, objExplosion);
                _ex.dmgPlayer = false;
                
                instance_destroy(self, true);
                
            }
            
        }
        
    }
    
    if (distance_to_object(objPlayer) > 5000) {
    
        instance_destroy(self, true);
    
    }