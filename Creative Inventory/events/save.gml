#define OnSave

    var _saveMap = ds_map_create();
    
    _saveMap[? "invulnable"] = objPlayer.invincible;
    _saveMap[? "increment"] = global.itemIncrement;
    _saveMap[? "gridsnap"] = global.gridSnap;
    
    ModSaveDataSubmit(_saveMap);
    
    ds_map_destroy(_saveMap);