#define SaveSaveData

    ModSaveDataSubmit(global.Data_SaveMap);
    
#define SetSaveKey(_key, _value)

    global.Data_SaveMap[? _key] = _value;
    
#define RemoveSaveKey(_key)

    ds_map_delete(global.Data_SaveMap, _key);