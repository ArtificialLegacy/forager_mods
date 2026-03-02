#define OnStep

    #region UpdateGUI
    
    if (room == rmGame) {
    
        UpdateGUI();
        
    }
    
    #endregion
    
    #region Slingshot
    
        if (room == rmGame) {
            
            if (objPlayer.slingshotCharge >= 0) {
            
                if (mouse_check_button(mb_left) and ToolSelected() == global.Item_Slingshot and SlingShotCheckAmmo()) {
                    
                    if (objPlayer.slingshotCharge < 100) {
                        
                        objPlayer.slingshotCharge++;
                        
                    }
                    
                } else if (objPlayer.slingshotCharge >= 70 and ToolSelected() == global.Item_Slingshot and SlingShotCheckAmmo()) { 
                    
                    if (QuestHasSecondary(SecondaryQuest.Slingshot)) {
                        
                        if (objPlayer.slingshotCharge == 100) {
                            
                            QuestCompleteSecondary(GetSecondaryID(SecondaryQuest.Slingshot));
                            
                        }
                        
                    }
                    
                    var _instProjectile = ModObjectSpawn(objPlayer.x, objPlayer.y, -100);
                    
                    var _ammo = SlingShotUseAmmo();
                    
                    with (_instProjectile) {
                        
                        sprite_index = _ammo[1];
                        dmg = _ammo[0] + ((objPlayer.slingshotCharge - 70) / 20);
                        
                        image_xscale = 0.75;
                        image_yscale = 0.75;
                        
                        var _dir = point_direction(objPlayer.x, objPlayer.y, mouse_x + random_range(-10, 10), mouse_y + random_range(-10, 10));
                        
                        image_angle = _dir - 90;
                        
                        motion_set(_dir, objPlayer.slingshotCharge / 30);
                        
                        damage = 0.6 + (0.1 * ((objPlayer.slingshotCharge - 70) div 5));
                        
                    }
                    
                    InstanceAssignMethod(_instProjectile, "step", ScriptWrap(SlingShotProjectileStep), true);
                    
                    objPlayer.slingshotCharge = -60;
                    
                } else if (objPlayer.slingshotCharge > 0) {
                    
                    objPlayer.slingshotCharge = 0;
                    
                }
                
            } else {
                
                objPlayer.slingshotCharge++;
                
            }
        }
    
    #endregion
    
    #region Open Quest GUI
    
    if (room == rmGame) {
        
        if (keyboard_check_pressed(ord("Q"))) {
            
            if (!objPlayer.questsOpen) {
                
                objPlayer.questsOpen = true;
                SetGUI(global.GUI_Quests);
                
            } else {
                
                objPlayer.questsOpen = false;
                ClearGUI();
                
            }
            
        } else if (keyboard_check_pressed(vk_escape)) {
            
            if (objPlayer.questsOpen) {
                
                objPlayer.questsOpen = false;
                ClearGUI();
                
            }
            
        }
        
    }
    
    #endregion
    
    #region Skill Grid
    
    if (room == rmGame and instance_exists(objPlayer)) {
        
        global.TempSkillPoints = objPlayer.skills;
        
    }
    
    if (room == rmSkillGrid) {
        
        with (objSkill) {
            
            if (position_meeting(mouse_x, mouse_y, self)) {
                
                selected = true;
                
            }
            
        }
        
        if (mouse_check_button(mb_left)) {
        
            if (objSkillGridControl.skillInspection != noone) {
                
                var _skill = global.Data_Skills[? objSkillGridControl.skillInspection.skillID];
                
                if (global.Data_TempSkills[? "skill_" + _skill[? "name"]] == UNLOCKED and global.TempSkillPoints > 0) {
                    
                    objSkillGridControl.skillInspection.skillCharge += 0.005;
                    objSkillGridControl.skillInspection.glowAlpha = objSkillGridControl.skillInspection.skillCharge;
                    
                    if (objSkillGridControl.skillInspection.skillCharge >= 0.5) {
                        
                        global.Data_TempSkills[? "skill_" + _skill[? "name"]] = OBTAINED;
                        script_execute(_skill[? "complete"]);
                        global.TempSkillPoints--;
                        
                        objSkillGridControl.skillInspection.image_index = 2;
                        objSkillGridControl.skillInspection.glowAlpha = 0;
                        objSkillGridControl.skillInspection = noone;
                        
                    }
                    
                }
                
            }
            
        } else {
            
            if (objSkillGridControl.skillInspection != noone) {
                
                var _skill = global.Data_Skills[? objSkillGridControl.skillInspection.skillID];
                
                if (GetSaveKey("skill_" + _skill[? "name"]) == UNLOCKED) {
                    
                    objSkillGridControl.skillInspection.skillCharge = 0;
                    objSkillGridControl.skillInspection.glowAlpha = 0;
                    
                }
                
            }
            
        }
        
    }
    
    #endregion
    
#define OnStepBegin

    #region Slingshot

    if (room == rmGame) {

        if (instance_exists(objPlayer)) {
                
            if (objPlayer.slingshotCharge < 0) {
                
                objPlayer.toolSwing = -180 + (180 - (abs(objPlayer.slingshotCharge) * 3));
               
            }
        
        }
        
    }
    
    #endregion
    
    #region Night / Day Events
    
        if (instance_exists(TimeControl)) {
            if (TimeControl.lightState == 3 && TimeControl.timer == 3) {
                
                OnNightBegin();
                
            }
            
            if (TimeControl.lightState == 1 && TimeControl.timer == 3) {
                
                OnDayBegin();
                
            }
            
        }
    
    #endregion
    
#define OnStepEnd

    #region Nuked Build Menu

        if (instance_exists(uiBuild)) {
            
            with (uiBuild) {
                
                instance_destroy(self);
                
            }
            
        }
        
    #endregion

    #region Slingshot

    if (room == rmGame) {

        if (instance_exists(objPlayer)) {
                
            if (mouse_check_button(mb_left) && ToolSelected() == global.Item_Slingshot and objPlayer.slingshotCharge <= 100) {
                
                objPlayer.toolSwing = 0;
               
            }
        
        }
        
    }
    
    #endregion
    
    #region XP
    
        if (room == rmGame) {
            
            objPlayer.xp = 0;
            objPlayer.level = 0;
            
        }
    
    #endregion
    
    #region Golden slime
    
        with (objSlime) {
            
            if (variable_instance_get(self, "questInstanceFrom") == DailyQuest.GoldenSlime) {
                
                sprite_index = global.Sprite_GoldenSlime;
                
            }
            
        }
    
    #endregion
    
    #region Slime Variants
    
        with (objSlime) {
            
            if (variable_instance_exists(self, "variant")) {
                
                switch (variable_instance_get(self, "variant")) {
                
                    case SlimeVariant.Blue:
                    
                        sprite_index = global.Sprite_BlueSlime;
                    
                    break;
                    
                    case SlimeVariant.Brown:
                    
                        sprite_index = global.Sprite_BrownSlime;
                    
                    break;
                    
                    case SlimeVariant.Purple:
                    
                        sprite_index = global.Sprite_PurpleSlime;
                    
                    break;
                    
                    case SlimeVariant.Red:
                    
                        sprite_index = global.Sprite_RedSlime;
                    
                    break;
                    
                    case SlimeVariant.Stone:
                    
                        sprite_index = global.Sprite_StoneSlime;
                    
                    break;
                    
                    case SlimeVariant.Black:
                    
                        sprite_index = global.Sprite_BlackSlime;
                    
                    break;
                    
                }
                
            }
            
        }
    
    #endregion
    
    #region Ancient skeleton
    
        with (objSkeleton) {
            
            if (variable_instance_exists(self, "isAncient")) {
                
                sprite_index = global.Sprite_AncientSkeleton;
                image_speed = 0.25;
                
            }
            
        }
    
    #endregion
    
    #region Prosperous tree particles
    
        with (objTree) {
            
            if (variable_instance_get(self, "questInstanceFrom") == DailyQuest.ProsperousTree) {
                
                if (particleSpawnTimer > 0) particleSpawnTimer--;
                
                if (particleSpawnTimer <= 0) {
                    
                    particleSpawnTimer = 5;
                    
                    var _x = x + random_range(-5, 5);
                    var _y = y + random_range(-30, 5);
                    
                    var _inst = ModObjectSpawn(_x, _y, depth - 1);
                    
                    with (_inst) {
                        
                        sprite_index = global.Sprite_GreenParticle;
                        life = 30;
                        
                    }
                    
                    InstanceAssignMethod(_inst, "step", ScriptWrap(ProsperousTreeParticleStep), false);
                    
                }
                
            }
            
        }
    
    #endregion
    
    #region Money rock particles
    
        with (objRock) {
            
            if (variable_instance_get(self, "questInstanceFrom") == DailyQuest.MoneyRock) {
                
                if (particleSpawnTimer > 0) particleSpawnTimer--;
                
                if (particleSpawnTimer <= 0) {
                    
                    particleSpawnTimer = 15;
                    
                    var _x = x + random_range(-5, 5);
                    var _y = y + random_range(-5, 5);
                    
                    var _inst = ModObjectSpawn(_x, _y, depth - 1);
                    
                    with (_inst) {
                        
                        sprite_index = global.Sprite_GoldenParticle;
                        life = 30;
                        
                    }
                    
                    InstanceAssignMethod(_inst, "step", ScriptWrap(MoneyRockParticleStep), false);
                    
                }
                
            }
            
        }
    
    #endregion