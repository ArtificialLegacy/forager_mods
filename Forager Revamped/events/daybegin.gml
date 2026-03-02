#define OnDayBegin

    #region Daily quest
    
        #region Clean last daily quest
        
            switch (GetBaseIDDaily(GetQuestID(objPlayer.dailyQuest))) {
            
                case DailyQuest.GoldenRock:
                    
                    with (objRock) {
                        
                        if (variable_instance_get(self, "questInstanceFrom") == DailyQuest.GoldenRock) {
                            
                            instance_destroy(self, false);
                            
                        }
                        
                    }
                
                    SetSaveKey("daily_quest_data_x", 0);
                    SetSaveKey("daily_quest_data_y", 0);
                
                break;
                
                case DailyQuest.GoldenSlime:
                    
                    with (objSlime) {
                        
                        if (variable_instance_get(self, "questInstanceFrom") == DailyQuest.GoldenSlime) {
                            
                            instance_destroy(self, false);
                            
                        }
                        
                    }
                
                    SetSaveKey("daily_quest_data_x", 0);
                    SetSaveKey("daily_quest_data_y", 0);
                
                break;
                
                case DailyQuest.ProsperousTree:
                    
                    with (objTree) {
                        
                        if (variable_instance_get(self, "questInstanceFrom") == DailyQuest.ProsperousTree) {
                            
                            instance_destroy(self, false);
                            
                        }
                        
                    }
                
                    SetSaveKey("daily_quest_data_x", 0);
                    SetSaveKey("daily_quest_data_y", 0);
                
                break;
                
                case DailyQuest.MoneyRock:
                    
                    with (objRock) {
                        
                        if (variable_instance_get(self, "questInstanceFrom") == DailyQuest.MoneyRock) {
                            
                            instance_destroy(self, false);
                            
                        }
                        
                    }
                
                    SetSaveKey("daily_quest_data_x", 0);
                    SetSaveKey("daily_quest_data_y", 0);
                
                break;
            
        }
        
        #endregion

        objPlayer.dailyQuest = GetQuest(RandomDailyQuest());
        
        script_execute(objPlayer.dailyQuest[? "start"]);
        
        SetSaveKey("quest_daily", GetQuestID(objPlayer.dailyQuest));
    
        TraceColored("A new daily quest is available!", c_blue);
    
    #endregion
    
    #region SkeletonRaid
    
        with (parEnemy) {
            
            if (variable_instance_exists(id, "partOfRaid")) {
                
                instance_destroy(self, false);
                
            }
            
        }
        
        with (objModEmpty) {
        
            if (variable_instance_exists(id, "skeletonsLeft")) {
                
                TraceColored("The skeleton raid is retreating.", c_green);
                
                SetSaveKey("skeleton_raid_active", false);
                
                instance_destroy(self, false);
                
            }
            
        }
        
    
    #endregion