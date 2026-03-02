#define SpawnSkeleton(_skip, _pos)

    var _x = _pos[0];
    var _y = _pos[1];

    var _inst = instance_create_depth(_x, _y, _y, objSkeleton);
    
    return _inst;