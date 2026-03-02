#define array_remove(_array, _index)

    var _newArray = [];
    
    for (var i = 0; i < array_length(_array); i++) {
        
        if (i != _index) {
            
            _newArray = array_push(_newArray, _array[i]);
            
        }
        
    } 
    
    return _newArray;