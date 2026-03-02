#define CreateDye(_color, _colorcode, _sprite, _blueprint)

    var _item = ItemCreate(undefined, _color + " dye", "paints things " + _color + ".", _sprite, ItemType.Consumable, ItemSubType.None, 40, 0, 0, _blueprint, ScriptWrap(UseDye), 60);
    
    global.Data_Dyes = array_push(global.Data_Dyes, [_item, _colorcode]);
    
    StructureAddItem(Structure.InscriptionTable, _item);
    
    return _item;