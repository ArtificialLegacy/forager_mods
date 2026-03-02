#define CheckBowAmmo

    if (ItemCount(Item.Arrow, false) >= 1) {
        
        return true;
        
    } else {
        
        return false;
        
    }