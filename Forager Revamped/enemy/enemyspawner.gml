#define EnemySpawnerStep

    if (TimeControl.lightState == 3 and GearGet(global.Gear_Sword, GearData.Current) != noone) {

        spawnTimer++;
        
        if (spawnTimer >= spawnTime)  {
            
            var _x;
            var _y;
            var _dir
            
            spawnTimer = 0;
            spawnTime = irandom_range(500, 1000);
            
            repeat(irandom_range(1, 2)) {
                
                var _spawn = irandom_range(0, array_length(spawns) - 1);
                
                var _spawnCheckCap = 0;
                
                do {
                    
                    _spawnCheckCap++;
                    
                    if (_spawnCheckCap > 1000) break; 
                    
                    if (irandom_range(0, 1) == 0) {
                        
                        _dir = -1;
                        
                    } else {
                        
                        _dir = 1;
                        
                    }
                    
                    _x = objPlayer.x + (random_range(50, 100) * _dir);
                    _y = objPlayer.y + (random_range(50, 100) * _dir);
                    
                } while (WaterCollision(_x, _y));
                
                if (_spawnCheckCap <= 1000) {
                    
                    var _inst = script_execute(spawns[_spawn], [_x, _y], null);
                 
                    OnMobSpawnCustom(_inst);
                    
                }
                
            }
            
        }
        
    }