#define WoodenPickaxeEligible

    if (HasGear(global.Item_WoodenPickaxe, global.Gear_Pickaxe)) {
        
        return true;
        
    } else {
        
        return false;
        
    }
    
#define WoodenSwordEligible

    if (HasGear(global.Item_WoodenSword, global.Gear_Sword)) {
        
        return true;
        
    } else {
        
        return false;
        
    }

#define SticksEligible

    if (ItemCount(global.Item_Stick, true) >= 10) {
        
        return true;
        
    } else {
        
        return false;
        
    }
    
#define PebblesEligible

    if (ItemCount(global.Item_Pebble, true) >= 10) {
        
        return true;
        
    } else {
        
        return false;
        
    }
    
#define OrangeEligible

    if (ItemCount(Item.Citrus, true) >= 1) {
        
        return true;
        
    } else {
        
        return false;
        
    }

#define NullEligible

    return false;