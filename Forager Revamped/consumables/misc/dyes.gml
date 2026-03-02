#define UseDye(_item)

    for (var i = 0; i < array_length(global.Data_Dyes); i++) {
        
        if (global.Data_Dyes[i][0] == _item) {
            
            with (GetSelection()) {
            
                dye = global.Data_Dyes[i][1];
                GainItem(Item.Bottle, 1);
                
            }
            
        }
        
    }