#define StartGoldenSlimeQuest

    var _x = 0;
    var _y = 0;
    
    do {
        
        _x = irandom_range(0, 83) * 16 + 8;
        _y = irandom_range(0, 83) * 16 + 8;
        
    } while (CheckCollision(_x, _y));
    
    var _inst = instance_create_depth(_x, _y, _y, objSlime);
    
    with (_inst) {
        
        sprite_index = global.Sprite_GoldenSlime;
        sprIdle = global.Sprite_GoldenSlime;
        sprWalk = global.Sprite_GoldenSlime;
        sprAttack = -1;
        
        questInstanceFrom = DailyQuest.GoldenSlime;
        
    }