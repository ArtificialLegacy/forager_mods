#define OnItemGet(_item, _quantity)

    if (_item == global.Item_WoodenPickaxe) {
        
        FinishImprovisedPickaxeTier();
        SetSaveKey("player_pickaxe_tier", PlayerPickaxeTiers.Stone);
        
        if (GetQuestID(objPlayer.primaryQuest) == PrimaryQuest.WoodenPickaxe) {
        
            QuestComplete(PrimaryQuest.WoodenPickaxe);
            
        }
        
    }
    
    if (_item == Item.BasicPickaxe) {
        
        FinishStonePickaxeTier();
        SetSaveKey("player_pickaxe_tier", PlayerPickaxeTiers.Slime);
        
    }
    
    if (_item == Item.SlimePickaxe) {
        
        SetSaveKey("obtained_slime_pickaxe", true);
        
    }
    
    if (_item == Item.GoldenPickaxe) {
        
        SetSaveKey("obtained_golden_pickaxe", true);
        
    }
    
    if (_item == Item.SkullPickaxe) {
        
        SetSaveKey("obtained_skull_pickaxe", true);
        
        FinishSkullPickaxeTier();
        SetSaveKey("player_pickaxe_tier", PlayerPickaxeTiers.Skull);
        
    }
    
    if (_item == global.Item_WoodenSword) {
        
        FinishImprovisedSwordTier();
        SetSaveKey("player_sword_tier", PlayerSwordTiers.Stone);
        
        if (GetQuestID(objPlayer.primaryQuest) == PrimaryQuest.WoodenSword) {
        
            QuestComplete(PrimaryQuest.WoodenSword);
            
        }
        
    }
    
    if (_item == global.Item_WoodenShovel) {
        
        FinishWoodenShovelTier();
        SetSaveKey("player_shovel_tier", PlayerShovelTiers.Stone);
        
    }
    
    if (_item == global.Item_StoneSword) {
        
        SetSaveKey("stone_sword_obtained", true);
        SetSaveKey("player_sword_tier", PlayerSwordTiers.Slime);
        FinishStoneSwordTier();
        
    }
    
    if (_item == Item.SkullSword) {
        
        SetSaveKey("player_sword_tier", PlayerSwordTiers.Skull);
        FinishSkullSwordTier();
        
    }
    
    if (_item == global.Item_Stick) {
        
        if (ItemCount(global.Item_Stick, true) + _quantity >= 10) {
        
            if (QuestHasSecondary(SecondaryQuest.Sticks)) {
                
                QuestCompleteSecondary(GetSecondaryID(SecondaryQuest.Sticks));
                
            }
            
        }
        
    }
    
    if (_item == global.Item_Pebble) {
        
        if (ItemCount(global.Item_Pebble, true) + _quantity >= 10) {
        
            if (QuestHasSecondary(SecondaryQuest.Pebbles)) {
                
                QuestCompleteSecondary(GetSecondaryID(SecondaryQuest.Pebbles));
                
            }
            
        }
        
    }
    
    if (_item == Item.Citrus) {
        
        if (QuestHasSecondary(SecondaryQuest.Orange)) {
            
            QuestCompleteSecondary(GetSecondaryID(SecondaryQuest.Orange));
            
        }
        
    }