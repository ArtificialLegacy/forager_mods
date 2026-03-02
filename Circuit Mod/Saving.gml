#define OnSave()

    if (ZoneCurrent() == Zone.Main or ZoneCurrent() == logicWorld) {
        
        var saveMap = ModSaveDataFetch();
        
        for (var i = 0; i < array_length(wireConnections); i++) {
            
            var index = string(ZoneCurrent()) + "-" + string(i);
            
            saveMap[? index + "_t_x"] = wireConnections[i][0].x;
            saveMap[? index + "_t_y"] = wireConnections[i][0].y;
            saveMap[? index + "_r_x"] = wireConnections[i][1].x;
            saveMap[? index + "_r_y"] = wireConnections[i][1].y;
            
            Trace(index);
            
        }
        
        ModSaveDataSubmit(saveMap);
        
        ds_map_destroy(saveMap);
        
    }
    
#define TryLoad()
    
    if (ZoneCurrent() == Zone.Main or ZoneCurrent() == logicWorld or array_find_index(zones, ZoneCurrent()) >= 0) {
        
        var saveMap = ModSaveDataFetch();
        
        var i = 0;
        
        var index = string(ZoneCurrent()) + "-" + string(i);
        
        while (ds_map_exists(saveMap, index + "_t_x")) {
            
            i++;
            
            var _t = instance_position(saveMap[? index + "_t_x"], saveMap[? index + "_t_y"], parStructure);
            var _r = instance_position(saveMap[? index + "_r_x"], saveMap[? index + "_r_y"], parStructure);
            
            if (_t == noone or _r == noone){
                
            } else {
                
                if (!(array_find_index(_t.outputs, _r) >= 0 or array_find_index(_r.outputs, _t))) {
                
                    CreateConnection(_t, _r);
                    
                }
                
            }
            
            index = string(ZoneCurrent()) + "-" + string(i);
            
        }
        
        ds_map_destroy(saveMap);
        
    }