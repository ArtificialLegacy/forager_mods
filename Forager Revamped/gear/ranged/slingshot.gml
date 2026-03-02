#define SlingShotCheckAmmo

    if (GetSaveKey("skill_seeds") == OBTAINED) {
        
        if (
            ItemCount(Item.SeedCotton, false) > 0 or 
            ItemCount(Item.SeedBeet, false) > 0 or 
            ItemCount(Item.SeedWheat, false) > 0 or 
            ItemCount(Item.SeedHotPepper, false) > 0 or
            ItemCount(Item.SeedPumpkin, false) > 0 or
            ItemCount(Item.SeedBerry, false) > 0 or
            ItemCount(Item.SeedFlower, false) > 0 or
            ItemCount(global.Item_Pebble, false) > 0
        ) {
            
            return true;
            
        } else {
            
            return false;
            
        }
        
    } else {
        
        if (ItemCount(global.Item_Pebble, false) > 0) {
            
            return true;
            
        } else {
            
            return false;
            
        }
        
    }
    
#define SlingShotProjectileStep

    if (distance_to_object(objPlayer) > 1000) {
        
        instance_destroy(self);
        
    } else {
    
        var _checkEnemy = instance_place(x, y, parEnemy);
        
        if (_checkEnemy != noone) {
            
            _checkEnemy.hp -= damage;
            
            instance_destroy(self);
            
        }
        
    }

#define SlingShotUseAmmo

    if (GetSaveKey("skill_seeds") == OBTAINED) {
        
        if (ItemCount(Item.SeedCotton, false) > 0) {
            
            RemoveItem(Item.SeedCotton, 1);
            return [3, sprSeedCotton];
            
        }
        
        if (ItemCount(Item.SeedBeet, false) > 0) {
            
            RemoveItem(Item.SeedBeet, 1);
            return [3, sprSeedBeet];
            
        }
        
        if (ItemCount(Item.SeedWheat, false) > 0) {
            
            RemoveItem(Item.SeedWheat, 1);
            return [3, sprSeedWheat];
            
        }
        
        if (ItemCount(Item.SeedHotPepper, false) > 0) {
            
            RemoveItem(Item.SeedHotPepper, 1);
            return [3, sprSeedHotPepper];
            
        }
        
        if (ItemCount(Item.SeedPumpkin, false) > 0) {
            
            RemoveItem(Item.SeedPumpkin, 1);
            return [3, sprSeedPumpkin];
            
        }
        
        if (ItemCount(Item.SeedBerry, false) > 0) {
            
            RemoveItem(Item.SeedBerry, 1);
            return [3, sprSeedBerry];
            
        }
        
        if (ItemCount(Item.SeedFlower, false) > 0) {
            
            RemoveItem(Item.SeedFlower, 1);
            return [3, sprSeedFlower];
            
        }
    
    }
    
    if (ItemCount(global.Item_Pebble, false) > 0) {
        
        RemoveItem(global.Item_Pebble, 1);
        return [1, global.Sprite_Pebble];
        
    }