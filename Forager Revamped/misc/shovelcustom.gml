#define UseShovelCustom(_items, _drops, _size, _energy)

    var _xx = mouse_x div 16 * 16 + 8;
    var _yy = mouse_y div 16 * 16 + 8;
    
    if (point_distance(_xx, _yy, objPlayer.x, objPlayer.y) < 32 and !WaterCollision(_xx, _yy) and !position_meeting(_xx, _yy, objDirt) and GetSelection() == noone) {
        
        var _item = _items[irandom_range(0, array_length(_items) - 1)];
        
        DropItem(_xx, _yy, _item, irandom_range(_drops[0], _drops[1]));
        
        instance_create_depth(_xx, _yy, _yy, objDirt);
        
        OnDigCustom(_xx, _yy);
        
    }