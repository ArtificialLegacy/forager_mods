#define OnDraw

if (room != rmGame) return;

if (ToolSelected() == itemWiringTool or ToolSelected() == itemWireCutter) {
    
    if (is_real(tempConnect) and ToolSelected() == itemWiringTool) draw_line_width_color(tempConnect.x, tempConnect.y, mouse_x, mouse_y, 2, c_gray, c_gray);

    for (var i = 0; i < array_length(wireConnections); i++) {
        
        if (wireConnections[i] != undefined) {
            
            var _c = wireConnections[i];
            
            var _c1 = _c[0];
            var _c2 = _c[1];
            
            if (_c1.state) {
                draw_line_width_color(_c1.x, _c1.y, _c2.x, _c2.y, 3, c_green, c_lime);
            }  else { 
                draw_line_width_color(_c1.x, _c1.y, _c2.x, _c2.y, 3, c_red, c_orange);
            }
            
        }
        
    }
}

#define CreateConnection(_transmitter, _reciever)

    _transmitter.outputs = array_push(_transmitter.outputs, _reciever);
    _reciever.inputs = array_push(_reciever.inputs, _transmitter);

    for (var i = 0; i < array_length(wireConnections); i++) {
        
        if (wireConnections[i] == undefined) {
            
            wireConnections[i] = [_transmitter, _reciever];
            
            return i;
            
        }
        
    }

    wireConnections = array_push(wireConnections, [_transmitter, _reciever]);
    
    return array_length(wireConnections) - 1;
    
#define RemoveConnection(_id)

    if (wireConnections[_id] == undefined) return;
    
    wireConnections[_id][0].outputs = array_remove(wireConnections[_id][0].outputs, wireConnections[_id][1]);
    wireConnections[_id][1].inputs = array_remove(wireConnections[_id][1].inputs, wireConnections[_id][0]);

    wireConnections[_id] = undefined;