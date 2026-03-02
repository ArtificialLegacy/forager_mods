#define UseBloodyMoon

    objPlayer.bossSummonTimer = 20;
    objPlayer.bossSummonSkip = 30;
    objPlayer.bossSummon = Boss.CrimsonMoon;
    
#define CrimsonMoonSummon

    var _inst = instance_create_depth(objPlayer.x, objPlayer.y - 200, -10000, objRock);
                
    with (_inst) {
        
        yTo = objPlayer.y - 50;
        stage = 0;
        summonTimer = 60;
        summonTimer2 = 30;
        movementCollide = false;
        sprite_index = global.Sprite_CrimsonMoonShell;
        antiCull = true;
        hpMax = 8000;
        summonAngle = 0;
        damageTimer = 0;
        t = 0;
        fist = 0;
        noDrops = true;
        shouldDespawn = true;
        
    }
    
    InstanceAssignMethod(_inst, "step", ScriptWrap(CrimsonMoonStep), true);
    InstanceAssignMethod(_inst, "drawGUI", ScriptWrap(CrimsonMoonDrawGUI), true);
    
#define CrimsonMoonStep

if (stage == 0 or stage == 1) hp = 8000;
if (stage == 2) {
    
    if (hp < 5000) {
        
        hp = 5000;
        stage = 3;
        sprite_index = global.Sprite_CrimsonMoonReleased;
        summonTimer = 60;
        
    }
    
}
if (stage == 3) {
    
    if (hp < 3000) {
        
        hp = 3000;
        stage = 4;
        summonTimer = 20;
        summonAngle = 0;
        
    }
    
}

if (hp <= 0) {
    
    DropItem(x, y, global.Item_Lunite, irandom_range(90, 120));
    DropItem(x, y, Item.HealingPotion, irandom_range(20, 35));
    DropItem(x, y, global.Item_LunarSigil, 1);
    
}

if (y != yTo and stage == 0) {
                    
    var _x = irandom_range(objPlayer.x - 200, objPlayer.x + 200);
    var _y = irandom_range(objPlayer.y - 200, objPlayer.y + 200);
    instance_create_depth(_x, _y, -10000, objLightning);
    
    y++;
    
} else if (stage == 0) {
    
    stage = 1;
    
    fist = instance_create_depth(x, y, -10001, objRock);
    
    with (fist) {
        
        sprite_index = global.Sprite_CrimsonFist;
        t = 0;
        p = other;
        antiCull = true;
        movementCollide = false;
        spawned = false;
        playerHitCd = 0;
        noDrops = true;
        shouldDespawn = true;
    
    }
    
    InstanceAssignMethod(fist, "step", ScriptWrap(CrimsonFistStep), true);
    
}

if (damageTimer > 0) damageTimer--;

if (stage == 1) {
    
    if (summonTimer == 0) {
        
        summonTimer = 30;
        
        for (var i = 0; i < 4; i++) {
        
            var _inst = ModObjectSpawn(x, y, -10000);
            
            with (_inst) {
                
                direction = other.summonAngle + 90 * i;
                speed = 4;
                sprite_index = global.Sprite_CrimsonBullet;
                antiCull = true;
                
            }
            
            InstanceAssignMethod(_inst, "step", ScriptWrap(CrimsonBulletStep), true);
            summonAngle++;
            
        }
        
    } else {
        
        summonTimer--;
        
    }
    
    var _particle = ModObjectSpawn(x, y, -10000);
        
    with (_particle) {
        
        sprite_index = global.Sprite_CrimsonFistParticle;
        direction = point_direction(x, y, other.fist.x, other.fist.y);
        speed = 10;
        target = other.fist;
        flife = 120;
        
    }
    
    InstanceAssignMethod(_particle, "step", ScriptWrap(CrimsonParticleStep), true);
    
    if (!instance_exists(fist)) {
        
        stage = 2;
        summonTimer = 120;
        
    }
    
} else if (stage == 2) {
    
    x += sign(objPlayer.x - x) * 0.5;
    y += sign(objPlayer.y - y) * 0.5;
    
    if (place_meeting(x, y, objPlayer) and damageTimer == 0) {
        
        objPlayer.hp -= 4;
        damageTimer = 60;
        
    }
    
    if (summonTimer == 0) {
        
        summonTimer = 120;
        
        var _dir = point_direction(x, y, objPlayer.x, objPlayer.y);
        
        var _x = x + lengthdir_x(20, _dir);
        var _y = y + lengthdir_y(20, _dir);
        
        var _instf = ModObjectSpawn(_x, _y, -10000);
            
        with (_instf) {
                
            direction = _dir;
            speed = 4;
            sprite_index = global.Sprite_CrimsonBullet;
            antiCull = true;
                
        }
            
        InstanceAssignMethod(_instf, "step", ScriptWrap(CrimsonBulletStep), true);
        
        for (var i = 0; i < 3; i++) {
        
            var _inst = ModObjectSpawn(_x + lengthdir_x(20 * i + 20, _dir - 90 * i), _y + lengthdir_y(20 * i + 20, _dir - 90), -10000);
            
            with (_inst) {
                
                direction = _dir;
                speed = 4;
                sprite_index = global.Sprite_CrimsonBullet;
                antiCull = true;
                
            }
            
            InstanceAssignMethod(_inst, "step", ScriptWrap(CrimsonBulletStep), true);
            
        }
        
        for (var i = 0; i < 3; i++) {
        
            var _inst = ModObjectSpawn(_x + lengthdir_x(20 * i + 20, _dir + 90 * i), _y + lengthdir_y(20 * i + 20, _dir + 90), -10000);
            
            with (_inst) {
                
                direction = _dir;
                speed = 4;
                sprite_index = global.Sprite_CrimsonBullet;
                antiCull = true;
                
            }
            
            InstanceAssignMethod(_inst, "step", ScriptWrap(CrimsonBulletStep), true);
            
        }
        
    } else {
        
        summonTimer--;
        
    }
    
} else if (stage == 3) {
    
    x = objPlayer.x + 150 * cos(degtorad(t));
    y = objPlayer.y - 150 * sin(degtorad(t));
    t++;
    
    image_angle = point_direction(x, y, objPlayer.x, objPlayer.y) - 90;
    
    if (summonTimer == 0) {
        
        summonTimer = 60;
        
            var _inst = ModObjectSpawn(x, y, -10000);
            
            with (_inst) {
                
                direction = point_direction(x, y, objPlayer.x, objPlayer.y);
                speed = 4;
                sprite_index = global.Sprite_CrimsonBullet;
                antiCull = true;
                
            }
            
            InstanceAssignMethod(_inst, "step", ScriptWrap(CrimsonExplosiveBulletStep), true);
        
    } else {
        
        summonTimer--;
        
    }
    
} else if (stage == 4) {
    
    if (summonTimer == 0) {
        
        summonTimer = 2;
        
        summonAngle += 10;
        
        for (var i = 0; i < 2; i++) {
        
            var _inst = ModObjectSpawn(x, y, -10000);
            
            with (_inst) {
                
                direction = other.summonAngle + (180 * i);
                speed = 4;
                sprite_index = global.Sprite_CrimsonBullet;
                antiCull = true;
                
            }
            
            InstanceAssignMethod(_inst, "step", ScriptWrap(CrimsonBulletStep), true);
            
        }
        
    } else {
        
        summonTimer--;
        
    }
    
}

#define CrimsonMoonDrawGUI

draw_set_halign(fa_center);

draw_set_color(c_red);

var _hu = 0;

if (instance_exists(fist)) {
    
    _hu = fist.hp;
    
}

draw_text_transformed(window_get_width() div 2, window_get_height() - 120, "crimson moon", 2, 2, 0);
draw_rectangle_color(window_get_width() div 2 - 202, window_get_height() - 100, window_get_width() div 2 + 202, window_get_height() - 85, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(window_get_width() div 2 - 200, window_get_height() - 98, (window_get_width() div 2 - 200) + (400 * ((hp + _hu) / 9000)), window_get_height() - 87, c_red, c_red, c_red, c_red, false);

draw_set_halign(fa_left);
draw_set_color(c_white);

#define CrimsonFistStep

if (!spawned) {
    
    spawned = true;
    hp = 1000;
    hpMax = 1000;
    
}

var _dist = 0;

with (p) {
    
    _dist = distance_to_object(objPlayer) + 20;
    
}

x = p.x + _dist * cos(degtorad(t));
y = p.y - _dist * sin(degtorad(t));
t += 2 + (hpMax - hp) div 500;

if (playerHitCd > 0) playerHitCd--;

if (place_meeting(x, y, objPlayer) and objPlayer.dodgeCd == 0 and playerHitCd == 0) {

    objPlayer.hp -= 3;
    playerHitCd = 60;

}

if (hp <= 0) {
    
    p.stage = 2;
    p.summonTimer = 120;
    
    instance_destroy(self, false);
    
}

#define CrimsonBulletStep

if (place_meeting(x, y, objPlayer) and objPlayer.dodgeCd == 0) {

    objPlayer.hp--;

    instance_destroy(self, true);

}

if (distance_to_object(objPlayer) > 5000) {
    
    instance_destroy(self, true);
    
}

#define CrimsonExplosiveBulletStep

if (place_meeting(x, y, objPlayer) and objPlayer.dodgeCd == 0) {

    instance_create_depth(x, y, -10000, objExplosion);

    instance_destroy(self, true);

}

if (distance_to_object(objPlayer) > 5000) {
    
    instance_destroy(self, true);
    
}

#define CrimsonParticleStep

    direction = point_direction(x, y, target.x, target.y);
    
    if (place_meeting(x, y, target)) {
        
        instance_destroy(self);
        
    } else {
        
        if (flife > 0) flife--;
        
        if (flife == 0) {
            
            instance_destroy(self);
            
        }
        
    }
