#define UseWiringTool

    var _inst = instance_position(mouse_x, mouse_y, parStructure);
    
    if (_inst != noone) {

        
        if (_inst.isNode) {
        
            if (tempConnect == undefined) {
               
                tempConnect = _inst;
               
            } else if (is_real(tempConnect)) {
                
                if (array_find_index(tempConnect.outputs, _inst) >= 0 or array_find_index(_inst.outputs, tempConnect) >= 0 or tempConnect == _inst) {
                    
                    tempConnect = undefined;
                    
                } else {
               
                    CreateConnection(tempConnect, _inst);
               
                    tempConnect = undefined;
                    
                }
               
            } else {
               
                tempConnect = undefined;
               
            }
            
        } else {
            
            tempConnect = undefined;
            
        }
        
    } else {
        
        tempConnect = undefined;
        
    }
    
#define UseWireCutter
    
    for (i = 0; i < array_length(wireConnections); i++) {
        
        if (wireConnections[i] == undefined) continue;
        
        if (CircleLineCollision(mouse_x, mouse_y, 3, wireConnections[i][0].x, wireConnections[i][0].y, wireConnections[i][1].x, wireConnections[i][1].y)) {
            
            RemoveConnection(i);
            break;
            
        }
        
    }
    
#define CircleLineCollision(cx, cy, r, x1, y1, x2, y2)

    var v1x = x2 - x1;
    var v1y = y2 - y1;
    
    var v2x = x1 - cx;
    var v2y = y1 - cy;
    
    var b = (v1x * v2x + v1y * v2y);
    var c = 2 * (v1x * v1x + v1y * v1y);
    b *= -2;
    
    var e = b * b - 2 * c * (v2x * v2x + v2y * v2y - r * r);
    
    if (e <= 0) return false;
    
    return true;
    
#define isNaN(value)

    return !(value <= 0) && !(value >= 0);