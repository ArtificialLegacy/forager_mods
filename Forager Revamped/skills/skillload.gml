#define LoadSkillGrid

    var _skillUnlocks = variable_global_get("skillUnlocked");
    _skillUnlocks[Skill.Combat] = LOCKED;
    _skillUnlocks[Skill.Gathering] = LOCKED;
    _skillUnlocks[Skill.Pet] = LOCKED;
    _skillUnlocks[Skill.Smelting] = LOCKED;
    _skillUnlocks[Skill.Economy] = LOCKED;
    _skillUnlocks[Skill.Industry] = LOCKED;
    _skillUnlocks[Skill.Fishing] = LOCKED;
    _skillUnlocks[Skill.Hunting] = LOCKED;
    _skillUnlocks[Skill.Carpentry] = LOCKED;
    _skillUnlocks[Skill.Masonry] = LOCKED;
    _skillUnlocks[Skill.Sewing] = LOCKED;
    _skillUnlocks[Skill.Cooking] = LOCKED;
    _skillUnlocks[Skill.Craftsmanship] = LOCKED;
    _skillUnlocks[Skill.Railroads] = LOCKED;
    variable_global_set("skillUnlocked", _skillUnlocks);

    with (objSkill) { 
        
        instance_destroy(self, false);
        
    }

    SpawnSkill(room_width div 2, room_height div 2, global.Skill_Combat);
    SpawnSkill(room_width div 2 + 60, room_height div 2 - 40, global.Skill_Smelting);
    SpawnSkill(room_width div 2 + 60, room_height div 2 + 40, global.Skill_Foraging);
    SpawnSkill(room_width div 2 + 60, room_height div 2 + 100, global.Skill_Pet);
    SpawnSkill(room_width div 2 + 120, room_height div 2 + 40, global.Skill_Seeds);
    SpawnSkill(room_width div 2, room_height div 2 - 80, global.Skill_Gold);
    SpawnSkill(room_width div 2 + 120, room_height div 2 - 40, global.Skill_AdvancedSmelting);
    SpawnSkill(room_width div 2 + 180, room_height div 2 + 80, global.Skill_Fishing);
    SpawnSkill(room_width div 2 + 240, room_height div 2 + 80, global.Skill_Hunting);
    SpawnSkill(room_width div 2 - 60, room_height div 2 - 40, global.Skill_Carpentry);
    SpawnSkill(room_width div 2 - 120, room_height div 2 - 40, global.Skill_Masonry);
    SpawnSkill(room_width div 2 + 60, room_height div 2 - 100, global.Skill_Sewing);
    SpawnSkill(room_width div 2 + 180, room_height div 2, global.Skill_Cooking);
    SpawnSkill(room_width div 2 + 180, room_height div 2 - 40, global.Skill_Furnace);
    SpawnSkill(room_width div 2 - 60, room_height div 2 - 100, global.Skill_Dyes);
    SpawnSkill(room_width div 2 - 120, room_height div 2 - 100, global.Skill_Railroad);
    SpawnSkill(room_width div 2, room_height div 2 - 140, global.Skill_GoldLust);
    
#define SpawnSkill(_x, _y, _skill)

    var _skillInst = instance_create_depth(_x, _y, -10000, objSkill);
    
    with (_skillInst) {
        
        sprite_index = _skill[? "background"];
        image_index = 0;
        
        skillName = _skill[? "name"];
        skillDesc = _skill[? "description"];
        
        skillID = _skill[? "id"];
        
        skillCharge = 0;
        
        skill = _skill[? "icon"];
        
        targetX = x;
        targetY = y;
        backAlpha = 1;
        
    }