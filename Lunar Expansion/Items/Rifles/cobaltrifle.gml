#define UseCobaltRifle

    var _ammo = UseAmmo();

    if (is_array(_ammo)) {

        objPlayer.energy -= 2;
    
        var _inst = ModObjectSpawn(x, y, -10000);
        
        with (_inst) {
            
            direction = point_direction(x, y, mouse_x, mouse_y);
            speed = 3;
            sprite_index = _ammo[0];
            dmg = _ammo[1];
            
        }
        
        InstanceAssignMethod(_inst, "step", ScriptWrap(RifleBulletStep), true);
        
    }