#define GiveXP(_xp)

    objPlayer.frXp += _xp;
    SetSaveKey("player_xp", objPlayer.frXp);
    
    while (objPlayer.frXp >= objPlayer.frXpCap) {
        
        objPlayer.frLevel++;
        objPlayer.skills += 1;
        objPlayer.frXp -= objPlayer.frXpCap;
        objPlayer.frXpCap += objPlayer.frXpUp;
        objPlayer.frXpUp += objPlayer.frXpUp div 6;
        
        SetSaveKey("player_level", objPlayer.frLevel);
        SetSaveKey("player_xp", objPlayer.frXp);
        SetSaveKey("player_xpcap", objPlayer.frXpCap);
        SetSaveKey("player_xpup", objPlayer.frXpUp);
        
    }