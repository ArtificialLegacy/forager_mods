#define OnItemUse(_item) 

    if (_item == Item.Berry) {
        
        if (GetSaveKey("skill_foraging") == OBTAINED) {
        
            var _willPoison = irandom_range(1, 15);
            
            if (_willPoison <= 4 and objPlayer.hp > 1) {
                
                objPlayer.hp--;
                
            }
            
        } else {
        
            var _willPoison = irandom_range(1, 15);
            
            if (_willPoison <= 2 and objPlayer.hp > 1) {
                
                objPlayer.hp--;
                
            }
            
        }
        
    }
    
    if (_item == global.Item_ImprovisedWorkstation) {
        
        if (GetQuestID(objPlayer.primaryQuest) == PrimaryQuest.ImprovisedWorkstation) {
            
            QuestComplete(PrimaryQuest.ImprovisedWorkstation);
            
        }
        
    }
    
    if (_item == global.Item_PoisonBerry) {
        
        if (QuestHasSecondary(SecondaryQuest.PoisonBerry)) {
            
            QuestCompleteSecondary(GetSecondaryID(SecondaryQuest.PoisonBerry));
            
        }
        
    }
    
    if (_item == global.Item_BerrySalad) {
        
        if (QuestHasSecondary(SecondaryQuest.BerrySalad)) {
            
            QuestCompleteSecondary(GetSecondaryID(SecondaryQuest.BerrySalad));
            
        }
        
    }
    
    if (_item == global.Item_Workstation) {
        
        if (GetQuestID(objPlayer.primaryQuest) == PrimaryQuest.Workstation) {
            
            QuestComplete(PrimaryQuest.Workstation);
            
        }
        
    }
    
    if (_item == global.Item_Smeltery) {
        
        if (GetQuestID(objPlayer.primaryQuest) == PrimaryQuest.Smeltery) {
            
            QuestComplete(PrimaryQuest.Smeltery);
            
        }
        
    }
    
    if (_item == global.Item_Anvil) {
        
        if (GetQuestID(objPlayer.primaryQuest) == PrimaryQuest.Anvil) {
            
            QuestComplete(PrimaryQuest.Anvil);
            
        }
        
    }
    
    if (_item == global.Item_WoodenCrate) {
        
        if (QuestHasSecondary(SecondaryQuest.WoodenCrate)) {
            
            QuestCompleteSecondary(GetSecondaryID(SecondaryQuest.WoodenCrate));
            
        }
        
    }
    
    if (_item == global.Item_OrangeJuice) {
        
        if (QuestHasSecondary(SecondaryQuest.OrangeJuice)) {
            
            QuestCompleteSecondary(GetSecondaryID(SecondaryQuest.OrangeJuice));
            
        }
        
    }
    
    if (_item == global.Item_SewingStation) {
        
        if (QuestHasSecondary(SecondaryQuest.SewingStation)) {
            
            QuestCompleteSecondary(GetSecondaryID(SecondaryQuest.SewingStation));
            
        }
        
    }
    
    if (_item == Item.Pizza) {
        
        SpawnSlimeioNimbus();
        
    }