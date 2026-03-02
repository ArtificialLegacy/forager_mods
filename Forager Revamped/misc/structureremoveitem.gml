#define StructureRemoveItem(_structure, _item)

    var _items = StructureGet(_structure, StructureData.Items);
    
    var _newItems = [];
    
    for (var i = 0; i < array_length(_items); i++) {
        
        if (_items[i] != _item) {
            
            _newItems = array_push(_newItems, _items[i]);
            
        }
        
    }
    
    StructureEdit(_structure, StructureData.Items, _newItems);