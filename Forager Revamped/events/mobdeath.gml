#define OnMobDeath(_inst)

    DropItem(_inst.x, _inst.y, Item.Coin, irandom_range(3, 8) * GetGoldModifier());
    
    if (variable_instance_get(self, "questInstanceFrom") == DailyQuest.GoldenSlime) {
                
        QuestCompleteDaily(GetDailyID(DailyQuest.GoldenSlime));
        
    }
    
    if (variable_instance_exists(self, "variant") and _inst.object_index == objSlime) {
        
        switch (variable_instance_get(self, "variant")) {
                
            case SlimeVariant.Blue:
            
                DropItem(_inst.x, _inst.y, Item.IronOre, irandom_range(1, 2));
            
            break;
            
            case SlimeVariant.Brown:
            
                DropItem(_inst.x, _inst.y, Item.Poop, 1);
                DropItem(_inst.x, _inst.y, Item.Sand, irandom_range(1, 3));
            
            break;
            
            case SlimeVariant.Purple:
            
                DropItem(_inst.x, _inst.y, global.Item_InfectedJelly, irandom_range(1, 3));
            
            break;
            
            case SlimeVariant.Red:
            
                DropItem(_inst.x, _inst.y, Item.Berry, irandom_range(1, 2));
            
            break;
            
            case SlimeVariant.Stone:
            
                DropItem(_inst.x, _inst.y, Item.Stone, irandom_range(1, 2));
            
            break;
            
            case SlimeVariant.Black:
            
                DropItem(_inst.x, _inst.y, Item.Coal, irandom_range(1, 2));
            
            break;
            
        }
        
    }
    
    if (irandom_range(0, 25) == 0) {
        
        DropItem(_inst.x, _inst.y, global.Item_Shuriken, irandom_range(3, 5));
        
    }
    
    #region skeleton raid
    
        if (variable_instance_exists(_inst, "partOfRaid")) {
    
            with (objModEmpty) {
        
                if (variable_instance_exists(id, "skeletonsLeft")) {
                    
                    skeletonsLeft--;
                    
                }
                
            }
            
        }
    
    #endregion
    
    #region ancient skeleton
    
        if (variable_instance_exists(_inst, "isAncient")) {
    
            DropItem(_inst.x, _inst.y, global.Item_AncientBone, irandom_range(1, 3));
            
        }
    
    #endregion