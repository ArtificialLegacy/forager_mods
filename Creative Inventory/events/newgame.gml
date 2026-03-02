#define OnNewGame()

    objPlayer.creativeMenuOpen = false;
    objPlayer.creativeMenuTab = CreativeMenuTab.Materials;
    objPlayer.invincible = true;
    
    global.materials = [];
    global.consumables = [];
    global.itemStructures = [];
    global.gear = [];
    
    for (var i = 0; i < array_length(Data.items); i++) {
        
        if (i == Item.Droid or i == Item.StaminaVessel or i == Item.Heart) continue;
        
        var _type = ItemGet(i, ItemData.Type);
        var _subtype = ItemGet(i, ItemData.SubType);
        
        if (_type == ItemType.Material) {
            
            global.materials = array_push(global.materials, i);
            
        } else if (_type == ItemType.Consumable) {
            
            if (_subtype == ItemSubType.Structure or _subtype == ItemSubType.Tile) {
                
                global.itemStructures = array_push(global.itemStructures, i);
                
            } else {
                
                global.consumables = array_push(global.consumables, i);
                
            }
            
        } else if (_type == ItemType.Gear) {
            
            global.gear = array_push(global.gear, i);
            
        }
        
    }