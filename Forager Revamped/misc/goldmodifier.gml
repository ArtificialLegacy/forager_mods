#define GetGoldModifier

    var _modifier = 1;
    
    if (GetSaveKey("skill_gold")) {
        
        _modifier += 0.1;
        
    }
    
    if (GetSaveKey("skill_gold lust")) {
        
        _modifier += 0.25;
        
    }
    
    return round(_modifier);