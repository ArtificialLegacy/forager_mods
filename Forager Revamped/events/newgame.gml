#define OnNewGame

    GainItem(global.Item_Fist, 1);
    GainItem(global.Item_ImprovisedWorkstation, 1);
    
    ds_map_destroy(global.Data_SaveMap);
    global.Data_SaveMap = ds_map_create();
    
    SetSaveKey("player_pickaxe_tier", PlayerPickaxeTiers.Fist);
    SetSaveKey("player_sword_tier", PlayerSwordTiers.Wood);
    SetSaveKey("player_shovel_tier", PlayerShovelTiers.Wood);
    
    SetSaveKey("obtained_slime_pickaxe", false);
    SetSaveKey("obtained_golden_pickaxe", false);
    SetSaveKey("obtained_skull_pickaxe", false);
    
    objPlayer.inventorySize = 8;
    
    InitPlayer();
    InitTimeControl();
    InitEnemyController();
    
    objPlayer.primaryQuest = global.Quest_ImprovisedWorkstation;
    objPlayer.secondaryQuests = [global.Quest_Sticks, global.Quest_Pebbles];
    objPlayer.dailyQuest = GetQuest(RandomDailyQuest());
    script_execute(objPlayer.dailyQuest[? "start"]);
    
    SetSaveKey("quest_primary", PrimaryQuest.ImprovisedWorkstation);
    SetSaveKey("quest_secondary_1", GetSecondaryID(SecondaryQuest.Sticks));
    SetSaveKey("quest_secondary_2", GetSecondaryID(SecondaryQuest.Pebbles));
    SetSaveKey("quest_daily", GetQuestID(objPlayer.dailyQuest));
    
    SetSaveKey("player_level", 0);
    SetSaveKey("player_xp", 0);
    SetSaveKey("player_xpcap", 25);
    SetSaveKey("player_xpup", 8);
    
    #region Skills
    
    SetSaveKey("skill_combat", UNLOCKED);
    SetSaveKey("skill_smelting", LOCKED);
    SetSaveKey("skill_foraging", LOCKED);
    SetSaveKey("skill_seeds", LOCKED);
    SetSaveKey("skill_pet", LOCKED);
    SetSaveKey("skill_gold", LOCKED);
    SetSaveKey("skill_advanced smelting", LOCKED);
    SetSaveKey("skill_fishing", LOCKED);
    SetSaveKey("skill_hunting", LOCKED);
    SetSaveKey("skill_carpentry", LOCKED);
    SetSaveKey("skill_masonry", LOCKED);
    SetSaveKey("skill_sewing", LOCKED);
    SetSaveKey("skill_cooking", LOCKED);
    SetSaveKey("skill_furnace", LOCKED);
    SetSaveKey("skill_dyes", LOCKED);
    SetSaveKey("skill_railroad", LOCKED);
    SetSaveKey("skill_gold lust", LOCKED);
    
    #endregion
    
    SetSaveKey("moon_phase", MoonStates.NewMoon);
    
    SetSaveKey("skeleton_raid_active", false);
    
    SetSaveKey("stone_sword_obtained", false);