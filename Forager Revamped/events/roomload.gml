#define OnRoomLoad

    if (room == rmSkillGrid) {
        
        LoadSkillGrid();
        global.LeaveSkill = true;
        
        for (var i = 0; i < Skills.Count; i++) {
                
                var _name = global.Data_Skills[? i][? "name"];
                
                global.Data_TempSkills[? "skill_" + _name] = GetSaveKey("skill_" + _name);
                
            }
        
    }