#define OnResourceDestroyCustom(_inst)

    #region Golden rock quest

        if (variable_instance_get(_inst, "questInstanceFrom") == DailyQuest.GoldenRock) {
            
            DropItem(_inst.x, _inst.y, Item.GoldIngot, irandom_range(2, 3));
            
            QuestCompleteDaily(GetDailyID(DailyQuest.GoldenRock));
            
        }
    
    #endregion
    
    #region Prosperous tree quest

        if (variable_instance_get(_inst, "questInstanceFrom") == DailyQuest.ProsperousTree) {
            
            DropItem(_inst.x, _inst.y, Item.Wood, irandom_range(2, 3));
            
            QuestCompleteDaily(GetDailyID(DailyQuest.ProsperousTree));
            
        }
    
    #endregion
    
    #region Money rock quest
    
        if (variable_instance_get(_inst, "questInstanceFrom") == DailyQuest.MoneyRock) {
            
            DropItem(_inst.x, _inst.y, Item.Coin, irandom_range(5, 8));
            
            QuestCompleteDaily(GetDailyID(DailyQuest.MoneyRock));
            
        }
    
    #endregion