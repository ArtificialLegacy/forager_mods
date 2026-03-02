#define UseFishTrap

    var _select = GetSelection();

    if (WaterCollision(mouse_x, mouse_y) and _select == noone and point_distance(objPlayer.x, objPlayer.y, mouse_x, mouse_y) < 32) {
        
        var _xx = mouse_x div 16 * 16 + 8;
        var _yy = mouse_y div 16 * 16 + 8;
        
        instance_create_depth(_xx, _yy, _yy, objFishTrap);
        
    }