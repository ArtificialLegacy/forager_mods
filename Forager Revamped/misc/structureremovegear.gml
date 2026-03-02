#define StructureRemoveGear(_structure, _gear)

    var _gears = StructureGet(_structure, StructureData.GearCategories);
    
    var _newGears = [];
    
    for (var i = 0; i < array_length(_gears); i++) {
        
        if (_gears[i] != _gear) {
            
            _newGears = array_push(_newGears, _gears[i]);
            
        }
        
    }
    
    StructureEdit(_structure, StructureData.GearCategories, _newGears);