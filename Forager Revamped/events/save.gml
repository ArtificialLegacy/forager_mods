#define OnSave

    SaveWoodenCrates();
    
    #region Skeleton raid
    
    with (objModEmpty) {
        
        if (variable_instance_exists(id, "timeTillSpawn")) {
            
            SaveSkeletonRaid();
            
        }
        
    }
    
    #endregion
    
    #region Slimeio Nimbus
    
    with (objModEmpty) {
        
        if (variable_instance_exists(id, "hitInst")) {
            
            SetSaveKey("slimeio_nimbus_active", true);
            SetSaveKey("slimeio_nimbus_x", hitInst.x);
            SetSaveKey("slimeio_nimbus_y", hitInst.y);
            
        }
        
    }
    
    #endregion
    
    #region Slime Variants
    
        #region Nuke old variants
    
            var i = 0;
        
            while (ds_map_exists(global.Data_SaveMap, "slime_variant_instances_" + string(i) + "_x")) {
                
                ds_map_delete(global.Data_SaveMap, "slime_variant_instances_" + string(i) + "_x");
                ds_map_delete(global.Data_SaveMap, "slime_variant_instances_" + string(i) + "_y");
                ds_map_delete(global.Data_SaveMap, "slime_variant_instances_" + string(i) + "_variant");
                
                i++;
                
            }
    
        #endregion
        
        #region Save current variants
        
            var _slimeInstances = [];
            
            with (objSlime) {
                
                if (variable_instance_exists(id, "variant")) {
                    
                    _slimeInstances = array_push(_slimeInstances, self);
                    
                }
                
            }
            
            for (var i = 0; i < array_length(_slimeInstances); i++) {
                
                SetSaveKey("slime_variant_instances_" + string(i) + "_x", _slimeInstances[i].x);
                SetSaveKey("slime_variant_instances_" + string(i) + "_y", _slimeInstances[i].y);
                SetSaveKey("slime_variant_instances_" + string(i) + "_variant", _slimeInstances[i].variant);
                
            }
        
        #endregion
    
    #endregion
    
    #region Ancient Skeletons
    
        #region Nuke old skeletons
    
            var i = 0;
        
            while (ds_map_exists(global.Data_SaveMap, "ancient_skeleton_instances_" + string(i) + "_x")) {
                
                ds_map_delete(global.Data_SaveMap, "ancient_skeleton_instances_" + string(i) + "_x");
                ds_map_delete(global.Data_SaveMap, "ancient_skeleton_instances_" + string(i) + "_y");
                
                i++;
                
            }
    
        #endregion
        
        #region Save current skeletons
        
            var _skeletonInstances = [];
            
            with (parEnemy) {
                
                if (variable_instance_exists(id, "isAncient")) {
                    
                    _skeletonInstances = array_push(_skeletonInstances, self);
                    
                }
                
            }
            
            for (var i = 0; i < array_length(_skeletonInstances); i++) {
                
                SetSaveKey("ancient_skeleton_instances_" + string(i) + "_x", _skeletonInstances[i].x);
                SetSaveKey("ancient_skeleton_instances_" + string(i) + "_y", _skeletonInstances[i].y);
                
            }
        
        #endregion
    
    #endregion
    
    #region Save daily quest data
    
        switch (GetBaseIDDaily(GetQuestID(objPlayer.dailyQuest))) {
            
            case DailyQuest.GoldenRock:
            
                var _x = 0;
                var _y = 0;
                
                with (objRock) {
                    
                    if (variable_instance_get(self, "questInstanceFrom") == DailyQuest.GoldenRock) {
                        
                        _x = x;
                        _y = y;
                        
                    }
                    
                }
            
                SetSaveKey("daily_quest_data_x", _x);
                SetSaveKey("daily_quest_data_y", _y);
            
            break;
            
            case DailyQuest.GoldenSlime:
            
                var _x = 0;
                var _y = 0;
                
                with (objSlime) {
                    
                    if (variable_instance_get(self, "questInstanceFrom") == DailyQuest.GoldenSlime) {
                        
                        _x = x;
                        _y = y;
                        
                    }
                    
                }
            
                SetSaveKey("daily_quest_data_x", _x);
                SetSaveKey("daily_quest_data_y", _y);
            
            break;
            
            case DailyQuest.ProsperousTree:
            
                var _x = 0;
                var _y = 0;
                
                with (objTree) {
                    
                    if (variable_instance_get(self, "questInstanceFrom") == DailyQuest.ProsperousTree) {
                        
                        _x = x;
                        _y = y;
                        
                    }
                    
                }
            
                SetSaveKey("daily_quest_data_x", _x);
                SetSaveKey("daily_quest_data_y", _y);
            
            break;
            
            case DailyQuest.MoneyRock:
            
                var _x = 0;
                var _y = 0;
                
                with (objRock) {
                    
                    if (variable_instance_get(self, "questInstanceFrom") == DailyQuest.MoneyRock) {
                        
                        _x = x;
                        _y = y;
                        
                    }
                    
                }
            
                SetSaveKey("daily_quest_data_x", _x);
                SetSaveKey("daily_quest_data_y", _y);
            
            break;
            
        }
    
    #endregion

    SaveSaveData();