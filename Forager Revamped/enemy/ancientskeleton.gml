#define SpawnAncientSkeleton(_skip, _pos)

    var _x = _pos[0];
    var _y = _pos[1];

    var _inst = instance_create_depth(_x, _y, _y, objSkeleton);
    
    with (_inst) {
        
        sprite_index = global.Sprite_AncientSkeleton;
        isAncient = true;
        
        hpMax = 12;
        hp = 12;
        
    }
    
    return _inst;