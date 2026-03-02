#define CreateSkill(_id, _name, _description, _icon, _background, _complete)

    var _skill = ds_map_create();
    
    _skill[? "id"] = _id;
    _skill[? "name"] = _name;
    _skill[? "description"] = _description;
    _skill[? "icon"] = _icon;
    _skill[? "background"] = _background;
    _skill[? "complete"] = _complete;
    
    global.Data_Skills[? _id] = _skill;
    
    return _skill;