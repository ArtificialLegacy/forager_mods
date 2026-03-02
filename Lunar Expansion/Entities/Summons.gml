#define SummonCreate(_name, _sprite, _step, _damage)

    var _summon = ds_map_create();
    
    _summon[? "name"] = _name;
    _summon[? "sprite"] = _sprite;
    _summon[? "step"] = _step;
    _summon[? "damage"] = _damage;
    
    return _summon;
    
#define UseAmmo

    if (ItemCount(global.Item_CobaltBullet, false) > 0) {
        
        RemoveItem(global.Item_CobaltBullet, 1);
        return [global.Sprite_CobaltProj, 0];
        
    } else if (ItemCount(global.Item_MythrilBullet, false) > 0) {
        
        RemoveItem(global.Item_MythrilBullet, 1);
        return [global.Sprite_MythrilProj, 3];
        
    } else if (ItemCount(global.Item_AdamantiteBullet, false) > 0) {
        
        RemoveItem(global.Item_AdamantiteBullet, 1);
        return [global.Sprite_AdamantiteProj, 5];
        
    } else if (ItemCount(global.Item_LuminiteBullet, false) > 0) {
        
        RemoveItem(global.Item_LuminiteBullet, 1);
        return [global.Sprite_LuminiteProj, 8];
    
    } else {
        
        return undefined;
        
    }
    
#define RifleBulletStep

    if (place_meeting(x, y, parEnemy)) {
        
        var _hit = instance_place(x, y, parEnemy);
        
        objPlayer.summonTarget = _hit;
        _hit.hp -= dmg;
        
        instance_destroy(self);
        
    } else if (place_meeting(x, y, parNatural)) {
        
        var _hit = instance_place(x, y, parNatural);
        _hit.hp -= dmg;
        
        objPlayer.summonTarget = _hit;
        
        instance_destroy(self);
        
    }
    
#define SummonSpawn(_summon)

    var _inst = ModObjectSpawn(objPlayer.x, objPlayer.y, -10000);
    
    with (_inst) {
        
        sprite_index = _summon[? "sprite"];
        xTo = objPlayer.x;
        yTo = objPlayer.y;
        timer = 60;
        dmg = _summon[? "damage"];
        
    }
    
    InstanceAssignMethod(_inst, "step", _summon[? "step"], false);
    
#define SummonProjectileStep

    if (place_meeting(x, y, parEnemy)) {
        
        var _inst = instance_place(x, y, parEnemy);
        
        _inst.hp -= dmg;
        instance_destroy(self, true);
        
    } else if (instance_exists(parNatural)) {
    
        if (place_meeting(x, y, parNatural)) {
            
            var _inst = instance_place(x, y, parNatural);
            
            if (instance_exists(_inst)) {
            
                _inst.hp -= dmg;
                instance_destroy(self, true);
                
            }
            
        }
        
    }
    
#define SummonExplosiveProjectileStep

    if (place_meeting(x, y, parEnemy)) {
        
        var _inst = instance_place(x, y, parEnemy);
        
        _inst.hp -= dmg;
        var _ex = instance_create_depth(x, y, 0, objExplosion);
        _ex.dmgPlayer = false;
        
        instance_destroy(self, true);
        
    } else if (instance_exists(parNatural)) {
    
        if (place_meeting(x, y, parNatural)) {
            
            var _inst = instance_place(x, y, parNatural);
            
            if (instance_exists(_inst)) {
            
                _inst.hp -= dmg;
                var _ex = instance_create_depth(x, y, 0, objExplosion);
                _ex.dmgPlayer = false;
                
                instance_destroy(self, true);
                
            }
            
        }
        
    }
    
#define LunarBeamStepEvent

    with (parEnemy) {
        
        if (place_meeting(x, y, other)) {
            
            hp -= other.dmg;
            
        }
        
    }
    
    with (parNatural) {
        
        if (place_meeting(x, y, other)) {
            
            hp -= other.dmg;
            
        }
        
    }
    
    instance_destroy(self, true);