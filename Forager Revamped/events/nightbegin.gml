#define OnNightBegin

    #region moon phases

    if (TimeControl.moonPhase == MoonStates.CrescentMoon2) {
        
        TimeControl.moonPhase = MoonStates.NewMoon;
        
    } else if (TimeControl.moonPhase == MoonStates.BloodMoon) {
        
        TimeControl.moonPhase = MoonStates.GibbousMoon2;
        
    } else {

        TimeControl.moonPhase++;
        
    }
    
    if (TimeControl.moonPhase == MoonStates.FullMoon) {
        
        if (irandom_range(0, 5) == 5) {
            
            TimeControl.moonPhase = MoonStates.BloodMoon;
            
        }
       
    }
    
    SetSaveKey("moon_phase", TimeControl.moonPhase);
    
    if (TimeControl.moonPhase == MoonStates.NewMoon) {
        
        TraceColored("The new moon rises.", c_lime);
        
    } else if (TimeControl.moonPhase == MoonStates.FullMoon) {
        
        TraceColored("The full moon rises.", c_lime);
        
    } else if (TimeControl.moonPhase == MoonStates.BloodMoon) {
        
        TraceColored("The blood moon rises.", c_red);
        
    }
    
    #endregion
    
    #region skeleton raid
    
        if (irandom_range(0, 10) == 0 and GetSaveKey("stone_sword_obtained")) {
            
            StartSkeletonRaid();
            
        }
    
    #endregion