#define LoadSaveData

    ds_map_destroy(global.Data_SaveMap);
    
    global.Data_SaveMap = ModSaveDataFetch();

#define GetSaveKey(_key)

    return global.Data_SaveMap[? _key];