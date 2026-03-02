#define GotoCircuitWorld

    if (ZoneCurrent() != Zone.Main) return;
    
    ZoneGoTo(logicWorld);
    
#define UseEdibleElectronic

    if (ZoneCurrent() == Zone.Main) {
        ZoneGoTo(logicWorld);
    } else if (ZoneCurrent() == logicWorld) {
        ZoneGoTo(Zone.Main);
    }