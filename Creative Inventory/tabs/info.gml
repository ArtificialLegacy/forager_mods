#define DrawInfoTab(_menu)

    var _items = surface_create(600, 550);
    
    surface_set_target(_items);
    
    draw_clear_alpha(c_black, 0);
    
    draw_set_halign(fa_left);
    
    
    
    draw_text_transformed(15, 25, "gain item: lclick", 0.8, 0.8, 0);
    draw_text_transformed(15, 40, "remove item: rclick", 0.8, 0.8, 0);
    draw_text_transformed(15, 55, "place instance: lclick", 0.8, 0.8, 0);
    draw_text_transformed(15, 70, "cancel placement: rclick", 0.8, 0.8, 0);
    draw_text_transformed(15, 85, "place multiple: shift", 0.8, 0.8, 0);
    
    
    
    surface_reset_target();
    
    surface_set_target(_menu);

    draw_set_alpha(1);

    draw_surface(_items, 0, 50);

    surface_reset_target();
    
    surface_free(_items);