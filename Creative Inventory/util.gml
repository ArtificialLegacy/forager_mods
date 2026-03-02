#define mouse_get_raw_x()

    var _pw = window_mouse_get_x() / window_get_width();
    var _dx = display_get_gui_width() * _pw;
    
    return ceil(_dx);
    
#define mouse_get_raw_y()

    var _ph = window_mouse_get_y() / window_get_height();
    var _dy = display_get_gui_height() * _ph;
    
    return ceil(_dy);
    
#define MenuOpen

    var _menuOpen = instance_exists(objPlayerMenu) or 
                    instance_exists(uiCrafting) or 
                    instance_exists(objPurchaseLand) or 
                    instance_exists(objStorageInventory) or 
                    instance_exists(objChooseBoon) or 
                    instance_exists(objSlots) or
                    instance_exists(objHopFrogTriviaControl) or
                    instance_exists(objCosmeticItemMenu) or
                    instance_exists(objMarketInventory) or
                    instance_exists(objTraderInventory) or
                    instance_exists(objSpiritOrbAllocation) or
                    instance_exists(uiInventory) or
                    instance_exists(uiBuild);
    
    return _menuOpen;