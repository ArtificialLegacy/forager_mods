#define CreateQuest(_id, _name, _description, _icon, _xp, _eligible)

    var _quest = ds_map_create();
    
    _quest[? "id"] = _id;
    _quest[? "name"] = _name;
    _quest[? "description"] = _description;
    _quest[? "icon"] = _icon;
    _quest[? "xp"] = _xp;
    _quest[? "eligible"] = _eligible;
    
    global.Data_Quests[? _id] = _quest;
    
    return _quest;
    
#define CreateSecondaryQuest(_id, _name, _description, _icon, _xp, _eligible)

    var _quest = ds_map_create();
    
    _quest[? "id"] = GetSecondaryID(_id);
    _quest[? "name"] = _name;
    _quest[? "description"] = _description;
    _quest[? "icon"] = _icon;
    _quest[? "xp"] = _xp;
    _quest[? "eligible"] = _eligible;
    
    global.Data_Quests[? GetSecondaryID(_id)] = _quest;
    
    return _quest;
    
#define CreateDailyQuest(_id, _name, _description, _icon, _xp, _start)

    var _quest = ds_map_create();
    
    _quest[? "id"] = GetDailyID(_id);
    _quest[? "name"] = _name;
    _quest[? "description"] = _description;
    _quest[? "icon"] = _icon;
    _quest[? "xp"] = _xp;
    _quest[? "start"] = _start;
    
    global.Data_Quests[? GetDailyID(_id)] = _quest;
    
    Trace(GetDailyID(_id));
    
    return _quest;
    
#define QuestComplete(_id)

    objPlayer.questComplete = array_push(objPlayer.questComplete, GetQuest(_id)[? "name"]);
    objPlayer.questCompleteTimer = 180;
    GiveXP(GetQuest(_id)[? "xp"]);
    
    if (_id + 1 != PrimaryQuest.Count) {
        
        objPlayer.primaryQuest = GetQuest(_id + 1);
    
        SetSaveKey("quest_primary", GetQuestID(objPlayer.primaryQuest));
        
        var _next = GetQuest(_id + 1);
        
        if (GetQuest(_next) != noone) {
        
            if (script_execute(_next[? "eligible"])) {
                
                QuestComplete(_id + 1);
                
            }
            
        }
        
    } else {
        
        objPlayer.primaryQuest = noone;
        
    }
    
#define QuestCompleteSecondary(_id)
    
    objPlayer.questComplete = array_push(objPlayer.questComplete, GetQuest(_id)[? "name"]);
    objPlayer.questCompleteTimer = 180;
    GiveXP(GetQuest(_id)[? "xp"]);
    
    var _newQuests = [];

    if (_id == GetQuestID(objPlayer.secondaryQuests[0])) {
        
        var _next = max(GetQuestID(objPlayer.secondaryQuests[0]) + 1, GetQuestID(objPlayer.secondaryQuests[1]) + 1);
        
        if (_next > GetSecondaryID(SecondaryQuest.Count)) {
            
            Trace("Test");
            
            _newQuests = [objPlayer.secondaryQuests[1], noone];
            
            objPlayer.secondaryQuests = _newQuests;
            
        } else {
        
            _newQuests = [objPlayer.secondaryQuests[1], GetQuest(_next)];
            
            objPlayer.secondaryQuests = _newQuests;
            
            if (GetQuest(_next) != noone) {
            
                if (script_execute(GetQuest(_next)[? "eligible"])) {
                
                    QuestCompleteSecondary(_next);
                
                }
                
            }
            
        }
        
    } else if (_id == GetQuestID(objPlayer.secondaryQuests[1])) {
        
        var _next = max(GetQuestID(objPlayer.secondaryQuests[0]) + 1, GetQuestID(objPlayer.secondaryQuests[1]) + 1);
        
        if (_next > GetSecondaryID(SecondaryQuest.Count)) {
            
            Trace("Test");
            
            _newQuests = [objPlayer.secondaryQuests[0], noone];
            
            objPlayer.secondaryQuests = _newQuests;
            
        } else {
        
            _newQuests = [objPlayer.secondaryQuests[0], GetQuest(_next)];
            
            objPlayer.secondaryQuests = _newQuests;
            
            if (GetQuest(_next) != noone) {
            
                if (script_execute(GetQuest(_next)[? "eligible"])) {
                
                    QuestCompleteSecondary(_next);
                
                }
                
            }
            
        }
        
    }
    
    SetSaveKey("quest_secondary_1", GetQuestID(objPlayer.secondaryQuests[0]));
    SetSaveKey("quest_secondary_2", GetQuestID(objPlayer.secondaryQuests[1]));
    
#define RandomDailyQuest()

    var _lid;

    if (GearGet(global.Gear_Sword, GearData.Current) == noone) {
        
        _lid = irandom_range(0, DailyQuest.Tier0Cap - 1);
        
    } else {
        
        _lid = irandom_range(0, DailyQuest.Tier1Cap - 1);
        if (_lid == DailyQuest.Tier0Cap) _lid--;
        
    }
    
    return GetDailyID(_lid);

#define QuestCompleteDaily(_id) 

    objPlayer.questComplete = array_push(objPlayer.questComplete, GetQuest(_id)[? "name"]);
    objPlayer.questCompleteTimer = 180;
    GiveXP(GetQuest(_id)[? "xp"]);
    
    objPlayer.dailyQuest = noone;
    
    SetSaveKey("quest_daily", GetQuestID(objPlayer.dailyQuest));
    
#define QuestHasSecondary(_id)

    if (GetQuestID(objPlayer.secondaryQuests[0]) - PrimaryQuest.Count == _id or GetQuestID(objPlayer.secondaryQuests[1]) - PrimaryQuest.Count == _id) {
        
        return true;
        
    } else {
        
        return false;
        
    }
    
#define GetQuestID(_quest)

    if (ds_map_valid(_quest)) {

        return _quest[? "id"];
        
    } else {
        
        return noone;
        
    }
    
#define GetQuest(_id)

    if (ds_map_exists(global.Data_Quests, _id)) {
        
        return global.Data_Quests[? _id];
        
    } else {
        
        return noone;
        
    }
    
#define GetSecondaryID(_id)

    return _id + PrimaryQuest.Count;
    
#define GetDailyID(_id)

    return GetSecondaryID(_id) + SecondaryQuest.Count;
    
#define GetBaseIDSecondary(_id)

    return _id - PrimaryQuest.Count;
    
#define GetBaseIDDaily(_id)

    return GetBaseIDSecondary(_id - SecondaryQuest.Count);