#define UseMythrilRifle

    var _ammo = UseAmmo();

    if (is_array(_ammo)) {

        objPlayer.energy -= 5;
    
        var _inst = ModObjectSpawn(x, y, -10000);
        
        with (_inst) {
            
            direction = point_direction(x, y, mouse_x, mouse_y);
            speed = 3;
            sprite_index = _ammo[0];
            dmg = _ammo[1] + 3;
            
        }
        
        InstanceAssignMethod(_inst, "step", ScriptWrap(RifleBulletStep), true);
        
    }