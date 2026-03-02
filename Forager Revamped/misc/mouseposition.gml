#define mouse_get_raw_x()

    var _pw = window_mouse_get_x() / window_get_width();
    var _dx = display_get_gui_width() * _pw;
    
    return ceil(_dx);
    
#define mouse_get_raw_y()

    var _ph = window_mouse_get_y() / window_get_height();
    var _dy = display_get_gui_height() * _ph;
    
    return ceil(_dy);