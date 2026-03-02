#define OnResourceHit(_inst)

    #region Money rock coins

    if (variable_instance_get(_inst, "questInstanceFrom") == DailyQuest.MoneyRock) {
        
        DropItem(_inst.x, _inst.y, Item.Coin, irandom_range(1, 2));
        
    }
    
    #endregion