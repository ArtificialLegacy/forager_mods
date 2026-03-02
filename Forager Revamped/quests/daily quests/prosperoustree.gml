#define StartProsperousTreeQuest

    var _x = 0;
    var _y = 0;
    
    do {
        
        _x = irandom_range(0, 83) * 16 + 8;
        _y = irandom_range(0, 83) * 16 + 8;
        
    } while (CheckCollision(_x, _y));
    
    var _inst = instance_create_depth(_x, _y, _y, objTree);
    
    with (_inst) {
        
        questInstanceFrom = DailyQuest.ProsperousTree;
        particleSpawnTimer = 0;
        
    }
    
#define ProsperousTreeParticleStep

    if (life > 0) life --;
    
    if (life <= 0) instance_destroy(self);