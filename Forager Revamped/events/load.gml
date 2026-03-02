#define OnLoad

    LoadSaveData();
    
    InitPlayer();
    InitTimeControl();
    InitEnemyController();
    
    TimeControl.moonPhase = GetSaveKey("moon_phase");
    
    #region Item Tiers
    
        if (GetSaveKey("player_pickaxe_tier") >= PlayerPickaxeTiers.Stone) {
            
            FinishImprovisedPickaxeTier();
            
        }
        
        if (GetSaveKey("player_pickaxe_tier") >= PlayerPickaxeTiers.Stone) {
            
            FinishStonePickaxeTier();
            
        }
        
        if (GetSaveKey("player_pickaxe_tier") >= PlayerPickaxeTiers.Skull) {
            
            FinishSkullPickaxeTier();
            
        }
        
        if (GetSaveKey("player_sword_tier") >= PlayerSwordTiers.Stone) {
            
            FinishImprovisedSwordTier();
            
        }
        
        if (GetSaveKey("player_sword_tier") >= PlayerSwordTiers.Slime) {
            
            FinishStoneSwordTier();
            
        }
        
        if (GetSaveKey("player_sword_tier") >= PlayerSwordTiers.Skull) {
            
            FinishSkullSwordTier();
            
        }
        
        if (GetSaveKey("player_shovel_tier") >= PlayerShovelTiers.Stone) {
            
            FinishWoodenShovelTier();
            
        }
    
    #endregion
    
    #region quests
    
        objPlayer.primaryQuest = GetQuest(GetSaveKey("quest_primary"));
        
        objPlayer.secondaryQuests = [];
        objPlayer.secondaryQuests[0] = GetQuest(GetSaveKey("quest_secondary_1"));
        objPlayer.secondaryQuests[1] = GetQuest(GetSaveKey("quest_secondary_2"));
        
        objPlayer.dailyQuest = GetQuest(GetSaveKey("quest_daily"));
    
    #endregion
    
    #region xp 
    
        objPlayer.frLevel = GetSaveKey("player_level");
        objPlayer.frXp = GetSaveKey("player_xp");
        objPlayer.frXpCap = GetSaveKey("player_xpcap");
        objPlayer.frXpUp = GetSaveKey("player_xpup");
    
    #endregion
    
    #region Skills 
        
    if (global.LeaveSkill) {
        
        global.LeaveSkill = false;
        objPlayer.skills = global.TempSkillPoints;
        
        for (var i = 0; i < Skills.Count; i++) {
            
            var _name = global.Data_Skills[? i][? "name"];
            
            SetSaveKey("skill_" + _name, global.Data_TempSkills[? "skill_" + _name]);
            
        }
        
    }
    
    if (GetSaveKey("skill_combat") == OBTAINED) {
        
        ItemEdit(global.Item_WoodenSword, ItemData.Unlocked, true);
        ItemEdit(global.Item_StoneSword, ItemData.Unlocked, true);
        ItemEdit(Item.SlimeSword, ItemData.Unlocked, true);
        ItemEdit(Item.GoldenSword, ItemData.Unlocked, true);
        ItemEdit(Item.SkullSword, ItemData.Unlocked, true);
        
    }
    
    if (GetSaveKey("skill_smelting") == OBTAINED) {
        
        ItemEdit(global.Item_Smeltry, ItemData.Unlocked, true);
        
    }
    
    if (GetSaveKey("skill_advanced smelting") == OBTAINED) {
        
        ItemEdit(Item.Steel, ItemData.Unlocked, true);
        ItemEdit(Item.Glass, ItemData.Unlocked, true);
        
    }
    
    #endregion
    
    #region Skeleton raid
    
        if (GetSaveKey("skeleton_raid_active")) {
            
            var _inst = ModObjectSpawn(0, 0, 0);
    
            with (_inst) {
                
                skeletonsLeft = GetSaveKey("skeleton_raid_left");
                timeTillSpawn = 0;
                
                spawnTimerMx = 180;
                spawnTimer = spawnTimerMx;
                
            }
            
            InstanceAssignMethod(_inst, "step", ScriptWrap(SkeletonRaidStep), true);
            InstanceAssignMethod(_inst, "drawGUI", ScriptWrap(SkeletonRaidDrawGUI), false);
            
        }
    
    #endregion
    
#define OnLoadEnd

    #region WoodenCrates
    
        var i = 0;
    
        while (ds_map_exists(global.Data_SaveMap, "wooden_crates_" + string(i) + "_x")) {
            
            var _x = GetSaveKey("wooden_crates_" + string(i) + "_x");
            var _y = GetSaveKey("wooden_crates_" + string(i) + "_y");
            
            var _inst = instance_position(_x, _y, objVault);
            
            with (_inst) {
                
                sprite_index = global.Sprite_WoodenCrate;
                maxSlots = 2;
                noDrops = true;
                selectionSize = 1;
                
            }
            
            i++;
            
        }
    
    #endregion
    
    #region Skeleton raid
    
        var i = 0;
    
        while (ds_map_exists(global.Data_SaveMap, "skeleton_raid_instances_" + string(i) + "_x")) {
            
            var _x = GetSaveKey("skeleton_raid_instances_" + string(i) + "_x");
            var _y = GetSaveKey("skeleton_raid_instances_" + string(i) + "_y");
            
            var _inst = instance_position(_x, _y, parEnemy);
            
            with (_inst) {
                
                partOfRaid = true;
                
            }
            
            i++;
            
        }
    
    #endregion
    
    #region Load daily quest data
    
        var _goldenRock = GetDailyID(DailyQuest.GoldenRock);
    
        switch (GetBaseIDDaily(GetQuestID(objPlayer.dailyQuest))) {
            
            case DailyQuest.GoldenRock:
            
                var _x = GetSaveKey("daily_quest_data_x");
                var _y = GetSaveKey("daily_quest_data_y");
                
                with (objRock) {
                    
                    if (x == _x and y == _y) {
                        
                        sprite_index = global.Sprite_GoldenRock;
                        questInstanceFrom = DailyQuest.GoldenRock;
                        
                    }
                    
                }
            
            break;
            
            case DailyQuest.GoldenSlime:
            
                var _x = GetSaveKey("daily_quest_data_x");
                var _y = GetSaveKey("daily_quest_data_y");
                
                with (objSlime) {
                    
                    if (x == _x and y == _y) {
                        
                        sprite_index = global.Sprite_GoldenSlime;
                        sprIdle = global.Sprite_GoldenSlime;
                        sprWalk = global.Sprite_GoldenSlime;
                        sprAttack = -1;
                        
                        questInstanceFrom = DailyQuest.GoldenSlime;
                        
                    }
                    
                }
            
            break;
            
            case DailyQuest.ProsperousTree:
            
                var _x = GetSaveKey("daily_quest_data_x");
                var _y = GetSaveKey("daily_quest_data_y");
                
                with (objTree) {
                    
                    if (x == _x and y == _y) {
                        
                        questInstanceFrom = DailyQuest.ProsperousTree;
                        particleSpawnTimer = 0;
                        
                    }
                    
                }
            
            break;
            
            case DailyQuest.MoneyRock:
            
                var _x = GetSaveKey("daily_quest_data_x");
                var _y = GetSaveKey("daily_quest_data_y");
                
                with (objRock) {
                    
                    if (x == _x and y == _y) {
                        
                        questInstanceFrom = DailyQuest.MoneyRock;
                        particleSpawnTimer = 0;
                        
                    }
                    
                }
            
            break;
            
        }
    
    #endregion
    
    #region Slimeio Nimbus
    
        if (GetSaveKey("slimeio_nimbus_active")) {
            
            var _inst = ModObjectSpawn(GetSaveKey("slimeio_nimbus_x"), GetSaveKey("slimeio_nimbus_y"), -10000);
            var _hitInst = instance_position(GetSaveKey("slimeio_nimbus_x"), GetSaveKey("slimeio_nimbus_y"), objSlime);
            _hitInst.visible = false;
            
            with (_inst) {
                
                state = SlimeioNimbusStates.Float;
                sprite_index = global.Sprite_SlimeioNimbusIdle;
                image_speed = 0.25;
                heightAboveShadow = 0;
                
                hitInst = _hitInst;
                
                moveToX = x;
                moveToY = y;
                
                spiralAngle = 0;
                spiralCharge = 0;
                
                circleCharge = 0;
            
            }
            
            InstanceAssignMethod(_inst, "step", ScriptWrap(SlimeioNimbusStep), false);
            InstanceAssignMethod(_inst, "draw", ScriptWrap(SlimeioNimbusDraw), false);
            InstanceAssignMethod(_inst, "drawGUI", ScriptWrap(SlimeioNimbusDrawGUI), true);
            
        }
    
    #endregion
    
    #region Slime Variants
    
        var i = 0;
    
        while (ds_map_exists(global.Data_SaveMap, "slime_variant_instances_" + string(i) + "_x")) {
            
            var _x = GetSaveKey("slime_variant_instances_" + string(i) + "_x");
            var _y = GetSaveKey("slime_variant_instances_" + string(i) + "_y");
            var _variant = GetSaveKey("slime_variant_instances_" + string(i) + "_variant");
            
            var _inst = instance_position(_x, _y, objSlime);
            
            with (_inst) {
                
                variant = _variant;
                
            }
            
            i++;
            
        }
    
    #endregion
    
    #region Ancient Skeletons
    
        var i = 0;
    
        while (ds_map_exists(global.Data_SaveMap, "ancient_skeleton_instances_" + string(i) + "_x")) {
            
            var _x = GetSaveKey("ancient_skeleton_instances_" + string(i) + "_x");
            var _y = GetSaveKey("ancient_skeleton_instances_" + string(i) + "_y");
            
            var _inst = instance_position(_x, _y, parEnemy);
            
            with (_inst) {
                
                sprite_index = global.Sprite_AncientSkeleton;
                isAncient = true;
                
            }
            
            i++;
            
        }
    
    #endregion