#define StartSkeletonRaid

    TraceColored("Skeletons are approaching...", c_red);

    var _inst = ModObjectSpawn(0, 0, 0);
    
    with (_inst) {
        
        timeTillSpawn = 600;
        skeletonsLeft = 25;
        spawnTimerMx = 180;
        spawnTimer = spawnTimerMx;
        
    }
    
    InstanceAssignMethod(_inst, "step", ScriptWrap(SkeletonRaidStep), true);
    InstanceAssignMethod(_inst, "drawGUI", ScriptWrap(SkeletonRaidDrawGUI), false);
    
#define SkeletonRaidStep

    if (skeletonsLeft <= 0) {
        
        TraceColored("The skeletons have been defeated!", c_green);
        SetSaveKey("skeleton_raid_active", false);
        
        with (parEnemy) {
            
            if (variable_instance_exists(id, "partOfRaid")) {
                
                instance_destroy(self, false);
                
            }
            
        }
        
        instance_destroy(self, false);
        
    } else {

        if (timeTillSpawn > 0) timeTillSpawn--;
        
        if (timeTillSpawn <= 0) {
            
            if (spawnTimer > 0) spawnTimer--;
            
            if (spawnTimer <= 0) {
                
                spawnTimer = spawnTimerMx;
                
                var _x;
                var _y;
                var _dir
                
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
                
                    var _inst = noone;
                    
                    if (irandom_range(0, 5) == 6) {
                        
                        _inst = instance_create_depth(_x, _y, -_y, objSkeletonArcher);
                        
                    } else {
                        
                        if (irandom_range(0, 3)) {
                        
                            _inst = SpawnAncientSkeleton(undefined, [_x, _y]);
                        
                        } else {
                        
                            _inst = instance_create_depth(_x, _y, -_y, objSkeleton);
                            
                        }
                        
                    }
                    
                    with (_inst) {
                        
                        partOfRaid = true;
                        
                    }
                    
                }
                
            }
            
        }
        
    }

#define SkeletonRaidDrawGUI

    if (timeTillSpawn <= 0) {
        
        draw_set_halign(fa_center);

        draw_set_color(c_white);
        
        draw_text_transformed(window_get_width() div 2, window_get_height() - 120, "skeleton raid", 2, 2, 0);
        draw_rectangle_color(window_get_width() div 2 - 202, window_get_height() - 100, window_get_width() div 2 + 202, window_get_height() - 85, c_black, c_black, c_black, c_black, false);
        draw_rectangle_color(window_get_width() div 2 - 200, window_get_height() - 98, (window_get_width() div 2 - 200) + (400 * (skeletonsLeft / 25)), window_get_height() - 87, c_red, c_red, c_red, c_red, false);
        
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        
    }
    
#define SaveSkeletonRaid

    SetSaveKey("skeleton_raid_active", true);
    
    var _mainInst = noone;
    
    with (objModEmpty) {
        
        if (variable_instance_exists(id, "timeTillSpawn")) {
            
            SetSaveKey("skeleton_raid_left", skeletonsLeft);
            
        }
        
    }
    
    #region Nuke old skeletons
    
        var i = 0;
    
        while (ds_map_exists(global.Data_SaveMap, "skeleton_raid_instances_" + string(i) + "_x")) {
            
            ds_map_delete(global.Data_SaveMap, "skeleton_raid_instances_" + string(i) + "_x");
            ds_map_delete(global.Data_SaveMap, "skeleton_raid_instances_" + string(i) + "_y");
            
            i++;
            
        }
    
    #endregion
    
    #region Save current skeletons
    
        var _skeletonInstances = [];
        
        with (parEnemy) {
            
            if (variable_instance_exists(id, "partOfRaid")) {
                
                _skeletonInstances = array_push(_skeletonInstances, self);
                
            }
            
        }
        
        for (var i = 0; i < array_length(_skeletonInstances); i++) {
            
            SetSaveKey("skeleton_raid_instances_" + string(i) + "_x", _skeletonInstances[i].x);
            SetSaveKey("skeleton_raid_instances_" + string(i) + "_y", _skeletonInstances[i].y);
            
        }
    
    #endregion