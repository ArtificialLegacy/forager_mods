#define OnLoad

    var _saveMap = ModSaveDataFetch();
    
    objPlayer.invincible = _saveMap[? "invulnable"];
    global.itemIncrement = _saveMap[? "increment"];
    global.gridSnap = _saveMap[? "gridsnap"];
    
    ds_map_destroy(_saveMap);
    
    if (objPlayer.invincible == undefined) objPlayer.invincible = true;
    if (global.itemIncrement == undefined) global.itemIncrement = 0;
    if (global.gridSnap == undefined) global.gridSnap = true;

    objPlayer.creativeMenuOpen = false;
    objPlayer.creativeMenuTab = CreativeMenuTab.Materials;
    
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