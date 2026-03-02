#define UseDivineMoon

    objPlayer.bossSummonTimer = 20;
    objPlayer.bossSummonSkip = 30;
    objPlayer.bossSummon = Boss.DivinityMoon;

#define MoonOfDivinitySummon

    var _inst = instance_create_depth(objPlayer.x, objPlayer.y - 200, -10000, objRock);
                
    with (_inst) {
        
        yTo = objPlayer.y - 50;
        stage = 0;
        movementCollide = false;
        sprite_index = global.Sprite_MoonOfDivinity;
        antiCull = true;
        hpMax = 50000;
        hp = hpMax;
        damageTimer = 0;
        t = 0;
        noDrops = true;
        shouldDespawn = true;
        pillar1 = noone;
        pillar2 = noone;
        pillar3 = noone;
        pillar4 = noone;
        beamTime = 120;
        beams = [];
        hitPlayerCool = 0;
        tpTime = 300;
        fade = 30;
        burstTime = -2;
        burstRadius = 0;
        burstHit = false;
        summonTime = 60;
        summonAngle = 0;
        summonTime2 = 60;
        half1 = noone;
        half2 = noone;
        hide = false;
        
    }
    
    InstanceAssignMethod(_inst, "step", ScriptWrap(DivineMoonStep), true);
    InstanceAssignMethod(_inst, "draw", ScriptWrap(DivineMoonDraw), false);
    InstanceAssignMethod(_inst, "drawGUI", ScriptWrap(DivineMoonDrawGUI), true);
    
#define DivineMoonStep

if (hp <= 0) {
    
    DropItem(x, y, global.Item_Lunite,    irandom_range(500, 650));
    DropItem(x, y, Item.HealingPotion,    irandom_range(200, 300));
    DropItem(x, y, global.Item_Astralite, irandom_range(5,   10));
    
}

if (y != yTo and stage == 0) {
    
    var _x = irandom_range(objPlayer.x - 200, objPlayer.x + 200);
    var _y = irandom_range(objPlayer.y - 200, objPlayer.y + 200);
    instance_create_depth(_x, _y, -10000, objLightning);
    
    y++;
    
} else if (stage == 0) {
    
    stage = 1;
        
    pillar1 = SummonDivinePillar(-40, -40, self);
    pillar2 = SummonDivinePillar(40,  -40, self);
    pillar3 = SummonDivinePillar(-40,  40, self);
    pillar4 = SummonDivinePillar(40,   40, self);
    
}

switch (stage) {
    
    case 1:
    
        hp = 50000;
        
        if (!instance_exists(pillar1) and !instance_exists(pillar2) and !instance_exists(pillar3) and !instance_exists(pillar4)) {
            
            stage = 2;
            
        }
    
    break;
    
    case 2:
    
        if (hp <= 40000) stage = 3;
    
        if (beamTime > 0) beamTime--;
        
        if (beamTime == 0) {
            
            beamTime = 120;
            
            repeat(15) {
                
                var _beam = ModObjectSpawn(x, y, -100000);
                
                with (_beam) {
                
                    direction = point_direction(x, y, objPlayer.x, objPlayer.y) + irandom_range(-70, 70);
                    sprite_index = global.Sprite_LunarBeam;
                    image_angle = direction + 90;
                    image_yscale = 1000;
                    life = 60;
                
                }
                
                InstanceAssignMethod(_beam, "step", ScriptWrap(DivineBeamStep), true);
                InstanceAssignMethod(_beam, "draw", ScriptWrap(DivineBeamDraw), false);
                
            }
            
        }
    
    break;
    
    case 3:
    
        if (hp <= 35000) stage = 4;
        
        if (hitPlayerCool > 0) hitPlayerCool--;
        
        if (place_meeting(x, y, objPlayer) and hitPlayerCool == 0 and fade == 30) {
            
            hitPlayerCool = 30;
            
            objPlayer.hp--;
            
        }
    
        if (tpTime > 0) tpTime--;
        
        if (tpTime == 0) {
            
            tpTime = 120;
            
            x = objPlayer.x;
            y = objPlayer.y;
            
            burstTime = 30;
            burstHit = false;
            
        }
        
        var _maxBurst = 60;
        
        if (burstTime > 0) burstTime--;
        
        if (burstTime == 0) {
            
            if (burstRadius < _maxBurst) {
                
                burstRadius++;
                
            } else if (burstRadius == _maxBurst) {
                
                burstTime = -1;
                
            }
            
        } else if (burstTime == -1) {
            
            if (burstRadius > 0) {
                
                burstRadius--;
                
            }
            
            if (burstRadius == 0) {
                
                burstTime = -2;
                
            }
            
        }
        
        if (burstRadius > 0 and distance_to_object(objPlayer) <= burstRadius and !burstHit) {
            
            objPlayer.hp -= 6;
            burstHit = true;
            
        }
    
    break;
    
    case 4:
    
        if (hp <= 20000) {
            
            stage = 5;
            
            DivineMoonStage5();
            
        }
        
        if (summonTime > 0) summonTime--;
        
        if (summonTime == 0) {
            
            summonTime = 60;
            summonAngle++;
            
            for (var i = 0; i < 20; i++) {
                
                var _inst = ModObjectSpawn(x, y, -100000);
                
                with (_inst) {
                    
                    direction = 18 * i + other.summonAngle;
                    speed = 3;
                    sprite_index = global.Sprite_DivineShard;
                    image_angle = direction + 90;
                    
                }
                
                InstanceAssignMethod(_inst, "step", ScriptWrap(DivineShardStep), true);
                
            }
            
            for (var i = 0; i < 4; i++) {
                
                for (var z = 0; z < 3; z++) {
                
                    var _inst = ModObjectSpawn(x, y, -100000);
                    
                    with (_inst) {
                        
                        direction = 45 * i + other.summonAngle - 5 + (5 * z);
                        speed = 3;
                        sprite_index = global.Sprite_DivineShard;
                        image_angle = direction + 90;
                        
                    }
                    
                    InstanceAssignMethod(_inst, "step", ScriptWrap(DivineShardStep), true);
                    
                }
                
            }
            
        }
        
        if (summonTime2 > 0) summonTime2--;
        
        if (summonTime2 == 0) {
            
            summonTime2 = 120;
            
            var _inst = ModObjectSpawn(x, y, -100000);
            
            with (_inst) {
                
                direction = point_direction(x, y, objPlayer.x, objPlayer.y);
                speed = 6;
                sprite_index = global.Sprite_DivineShard;
                image_angle = direction + 90;
                image_xscale = 2;
                image_yscale = 2;
                
            }
            
            InstanceAssignMethod(_inst, "step", ScriptWrap(DivineShardStep), true);
            
        }
    
    break;
    
    case 5:
        
        var _hp = 0;
        
        if (instance_exists(half1)) {
            
            _hp += half1.hp;
            
        }
        
        if (instance_exists(half2)) {
            
            _hp += half2.hp;
            
        }
        
        hp = _hp;
        
    break;
    
}

#define SummonDivinePillar(_x, _y, _b)

    var _pillar = instance_create_depth(x, y, -10001, objRock);

    with (_pillar) {
        
        x = other.x - _x;
        y = other.y - _y;

        sprite_index = global.Sprite_DivinePillar;
        t = 0;
        p = other;
        antiCull = true;
        movementCollide = false;
        playerHitCd = 0;
        noDrops = true;
        shouldDespawn = true;
        hpMax = 5000;
        hp = hpMax;
        summonTime = 60;
        b = _b;
        particleTime = 20;
        
    }
    
    InstanceAssignMethod(_pillar, "step", ScriptWrap(DivinePillarStep), true);
    
    return _pillar;

#define DivineMoonDraw

    if (stage != 3 and !hide) draw_self();
    
    if (stage == 1) {
        
        draw_set_alpha(0.5);
        
        draw_circle_color(x, y, 40, c_aqua, c_aqua, false);
        
        draw_set_alpha(1);
    
    }
    
    if (stage == 3) {
        
        if (tpTime < 30) {
            
            fade = tpTime;
            
            draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, fade / 30);
            
        } else {
            
            if (fade < 30) {
                
                fade++;
                draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, fade / 30);
                
            } else {
            
                draw_self();
                
            }
            
        }
        
        if (burstRadius > 0) {
            
            draw_set_alpha(0.5);
            
            draw_circle_color(x, y, burstRadius, c_aqua, c_aqua, false);
            
            draw_set_alpha(1);
            
        }
        
    }

#define DivineMoonDrawGUI

    draw_set_halign(fa_center);
    
    draw_set_color(c_white);
    
    var _hu = 0;
    
    if (instance_exists(pillar1)) {
        
        _hu += pillar1.hp;
        
    }
    if (instance_exists(pillar2)) {
        
        _hu += pillar2.hp;
        
    }
    if (instance_exists(pillar3)) {
        
        _hu += pillar3.hp;
        
    }
    if (instance_exists(pillar4)) {
        
        _hu += pillar4.hp;
        
    }
    
    draw_text_transformed(window_get_width() div 2, window_get_height() - 120, "moon of divinity", 2, 2, 0);
    draw_rectangle_color(window_get_width() div 2 - 202, window_get_height() - 100, window_get_width() div 2 + 202, window_get_height() - 85, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(window_get_width() div 2 - 200, window_get_height() - 98, (window_get_width() div 2 - 200) + (400 * ((hp + _hu) / 70000)), window_get_height() - 87, c_aqua, c_aqua, c_white, c_white, false);
    
    draw_set_halign(fa_left);
    draw_set_color(c_white);

#define DivinePillarStep

    if (summonTime > 0) summonTime--;
    
    if (summonTime == 0) {
        
        summonTime = 20;
        
        var _bullet = ModObjectSpawn(x, y, -100000);
        
        with (_bullet) {
            
            sprite_index = global.Sprite_DivineBullet;
            
            direction = point_direction(x, y, objPlayer.x, objPlayer.y);
            speed = 5;
            
        }
        
        InstanceAssignMethod(_bullet, "step", ScriptWrap(DivineBulletStep), true);
        
    }
    
    if (particleTime > 0) particleTime--;
    
    if (particleTime == 0) {
        
        particleTime = 5;
        
        var _inst = ModObjectSpawn(x, y, -10000);
        
        with (_inst) {
            
            sprite_index = global.Sprite_DivineMoonPillarParticle;
            direction = point_direction(x, y, other.b.x, other.b.y) + irandom_range(-5, 5);
            speed = 3;
            target = other.b;
            
        }
        
        InstanceAssignMethod(_inst, "step", ScriptWrap(DivinePillarParticleStep), true);
        
    }
    
#define DivineMoonStage5

    half1 = instance_create_depth(x, y, -100000, objRock);
    half2 = instance_create_depth(x, y, -100000, objRock);
    
    with (half1) {
        
        sprite_index = global.Sprite_MoonOfDivinityLeft;
        antiCull = true;
        noDrops = true;
        x = objPlayer.x + 50;
        y = objPlayer.y;
        angle = 0;
        hpMax = 10000;
        hp = 10000;
        summonTime = 60;
        
    }
    
    with (half2) {
        
        sprite_index = global.Sprite_MoonOfDivinityLeft;
        antiCull = true;
        noDrops = true;
        x = objPlayer.x - 50;
        y = objPlayer.y;
        angle = 180;
        hpMax = 10000;
        hp = 10000;
        summonTime = 60;
        
    }
    
    
    InstanceAssignMethod(half1, "step", ScriptWrap(DivineHalfLeftStep), true);
    InstanceAssignMethod(half2, "step", ScriptWrap(DivineHalfRightStep), true);
    
    hide = true;

#define DivinePillarParticleStep

    if (place_meeting(x, y, target)) {
        
        instance_destroy(self);
        
    }

#define DivineBulletStep

    if (place_meeting(x, y, objPlayer) and objPlayer.dodgeCd == 0) {
    
        objPlayer.hp--;
    
        instance_destroy(self, true);
    
    }
    
    if (distance_to_object(objPlayer) > 5000) {
        
        instance_destroy(self, true);
        
    }

#define DivineBeamStep

    if (life > 0) life--;
    
    if (life == 0) {
        
        with (objPlayer) {
            
            var _angleDiff = abs((point_direction(other.x, other.y, x, y) + 90) - other.image_angle);
            
            if (place_meeting(x, y, other) and _angleDiff <= 5) {
                
                hp -= 5;
                
            }
            
        }
        
        instance_destroy(self);
        
    }

#define DivineBeamDraw

    var _alpha = 1 - (life / 60);
    if (life % 5 == 0 and life > 10) _alpha = 0;
    draw_sprite_ext(sprite_index, 0, x, y, 1, 1000, image_angle, c_white, _alpha);
    
#define DivineShardStep
    
    if (place_meeting(x, y, objPlayer)) {
        
        objPlayer.hp--;
        instance_destroy(self);
        
    } else if (distance_to_object(objPlayer) > 1500) {
        
        instance_destroy(self);
        
    }
    
#define DivineShardLargeStep

    if (place_meeting(x, y, objPlayer)) {
        
        objPlayer.hp -= 3;
        instance_destroy(self);
        
    } else if (distance_to_object(objPlayer) > 1500) {
        
        instance_destroy(self);
        
    }

#define DivineHalfLeftStep

    image_angle = point_direction(x, y, objPlayer.x, objPlayer.y);
    
    x = objPlayer.x + 100 * cos(degtorad(angle));
    y = objPlayer.y - 100 * sin(degtorad(angle));
    angle += 5;
    
    if (summonTime > 0) summonTime--;
    
    if (summonTime == 0) {
        
        summonTime = 60;
        
        var _inst = ModObjectSpawn(x, y, -10000);
        
        with (_inst) {
            
            sprite_index = global.Sprite_DivineShard;
            direction = point_direction(x, y, objPlayer.x, objPlayer.y);
            image_angle = direction + 90;
            speed = 5;
            image_xscale = 3;
            image_yscale = 3;
            
        }
        
        InstanceAssignMethod(_inst, "step", ScriptWrap(DivineShardLargeStep), true);
        
    }

#define DivineHalfRightStep

    image_angle = point_direction(x, y, objPlayer.x, objPlayer.y) + 180;
    x = objPlayer.x + 100 * cos(degtorad(angle));
    y = objPlayer.y - 100 * sin(degtorad(angle));
    angle += 5;
    
    if (summonTime > 0) summonTime--;
    
    if (summonTime == 0) {
        
        summonTime = 30;
        
        repeat (3) {
        
            var _inst = ModObjectSpawn(x, y, -10000);
            
            with (_inst) {
                
                sprite_index = global.Sprite_DivineShard;
                direction = point_direction(x, y, objPlayer.x, objPlayer.y) + irandom_range(-10, 10);
                image_angle = direction + 90;
                speed = 5;
                
            }
            
            InstanceAssignMethod(_inst, "step", ScriptWrap(DivineShardStep), true);
            
        }
        
    }
