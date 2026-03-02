#define HasGear(_item, _gear)

    if(GearGet(_gear, GearData.Current) == _item) {
        
       return true;
        
    } else {
        
        return false;
        
    }