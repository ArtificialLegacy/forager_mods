#define Main
    
    globalvar spriteWiringTool;
    spriteWiringTool = sprite_add("./Sprites/wiring_tool.png", 0, false, false, 8, 8);
    
    globalvar itemWiringTool;
    itemWiringTool = ItemCreate(undefined, "Wiring Tool", "Connects wires together to make circuits.", spriteWiringTool, ItemType.Gear, ItemSubType.None, 0, 0, 0, [Item.Steel, 5], ScriptWrap(UseWiringTool));
    
    globalvar catWiringTool;
    catWiringTool = GearCategoryCreate(undefined, "wiringTool", true, false);
    
    GearCategoryAddItems(catWiringTool, itemWiringTool);
    
    globalvar spriteWireCutter;
    spriteWireCutter = sprite_add("./Sprites/wire_cutter.png", 0, false, false, 8, 8);
    
    globalvar itemWireCutter;
    itemWireCutter = ItemCreate(undefined, "Wire Cutter", "Removes wire connections.", spriteWireCutter, ItemType.Gear, ItemSubType.None, 0, 0, 0, [Item.GoldIngot, 25], ScriptWrap(UseWireCutter));
    
    globalvar catWireCutter;
    catWireCutter = GearCategoryCreate(undefined, "wireCutter", true, false);
    
    GearCategoryAddItems(catWireCutter, itemWireCutter);
    
    globalvar spriteEdibleElectronic;
    spriteEdibleElectronic = sprite_add("./sprites/edible_electronic.png", 0, false, false, 8, 8);
    
    globalvar itemEdibleElectronic;
    itemEdibleElectronic = ItemCreate(undefined, "Edible Electronic", "Allows you to teleport to a circuit world.", spriteEdibleElectronic, ItemType.Gear, ItemSubType.None, 0, 0, 0, [Item.Electronics, 1, Item.Bread, 1000], ScriptWrap(UseEdibleElectronic));
    
    globalvar catEdibleElectronic;
    catEdibleElectronic = GearCategoryCreate(undefined, "edibleElectronic", true, false);
    
    GearCategoryAddItems(catEdibleElectronic, itemEdibleElectronic);
    
    globalvar notSpriteOff;
    notSpriteOff = sprite_add("./Sprites/not_off.png", 0, false, false, 8, 8);
    globalvar notSpriteOn;
    notSpriteOn = sprite_add("./Sprites/not_on.png", 0, false, false, 8, 8);
    
    globalvar gateNot;
    gateNot = LogicFactory("NOT Gate", "Inverts the input.", notSpriteOff);
    
    globalvar orSpriteOff;
    orSpriteOff = sprite_add("./Sprites/or_off.png", 0, false, false, 8, 8);
    globalvar orSpriteOn;
    orSpriteOn = sprite_add("./Sprites/or_on.png", 0, false, false, 8, 8);
    
    globalvar gateOr;
    gateOr = LogicFactory("OR Gate", "On if any input are on.", orSpriteOff);
    
    globalvar andSpriteOff;
    andSpriteOff = sprite_add("./Sprites/and_off.png", 0, false, false, 8, 8);
    globalvar andSpriteOn;
    andSpriteOn = sprite_add("./Sprites/and_on.png", 0, false, false, 8, 8);
    
    globalvar gateAnd;
    gateAnd = LogicFactory("AND Gate", "On if all inputs are on.", andSpriteOff);
    
    globalvar xorSpriteOff;
    xorSpriteOff = sprite_add("./Sprites/xor_off.png", 0, false, false, 8, 8);
    globalvar xorSpriteOn;
    xorSpriteOn = sprite_add("./Sprites/xor_on.png", 0, false, false, 8, 8);
    
    globalvar gateXor;
    gateXor = LogicFactory("XOR Gate", "On if only one input is on.", xorSpriteOff);
    
    globalvar nandSpriteOff;
    nandSpriteOff = sprite_add("./Sprites/nand_off.png", 0, false, false, 8, 8);
    globalvar nandSpriteOn;
    nandSpriteOn = sprite_add("./Sprites/nand_on.png", 0, false, false, 8, 8);
    
    globalvar gateNand;
    gateNand = LogicFactory("NAND Gate", "Off if all inputs are on.", nandSpriteOff);
    
    globalvar xnorSpriteOff;
    xnorSpriteOff = sprite_add("./Sprites/xnor_off.png", 0, false, false, 8, 8);
    globalvar xorSpriteOn;
    xnorSpriteOn = sprite_add("./Sprites/xnor_on.png", 0, false, false, 8, 8);
    
    globalvar gateXnor;
    gateXnor = LogicFactory("XNOR Gate", "On if all inputs are on or all inputs are off.", xnorSpriteOff);
    
    globalvar monoSpriteOff;
    monoSpriteOff = sprite_add("./Sprites/mono_off.png", 0, false, false, 8, 8);
    globalvar monoSpriteOn;
    monoSpriteOn = sprite_add("./Sprites/mono_on.png", 0, false, false, 8, 8);
    
    globalvar gateMono;
    gateMono = LogicFactory("Monostable Gate", "Only gives off a pulse for 1 update cycle.", monoSpriteOff);
    
    globalvar lightSpriteOff;
    lightSpriteOff = sprite_add("./Sprites/light_off.png", 0, false, false, 8, 8);
    globalvar lightSpriteOn;
    lightSpriteOn = sprite_add("./Sprites/light_on.png", 0, false, false, 8, 8);
    
    globalvar gateLight;
    gateLight = LogicFactory("Light", "Lights up when powered.", lightSpriteOff);
    
    globalvar buttonSpriteOff;
    buttonSpriteOff = sprite_add("./Sprites/button_off.png", 0, false, false, 8, 8);
    globalvar buttonSpriteOn;
    buttonSpriteOn = sprite_add("./Sprites/button_on.png", 0, false, false, 8, 8);
    
    globalvar gateButton;
    gateButton = LogicFactory("Button", "Provides power when clicked.", buttonSpriteOff);
    
    globalvar switchSpriteOff;
    switchSpriteOff = sprite_add("./Sprites/switch_off.png", 0, false, false, 8, 8);
    globalvar switchSpriteOn;
    switchSpriteOn = sprite_add("./Sprites/switch_on.png", 0, false, false, 8, 8);
    
    globalvar gateSwitch;
    gateSwitch = LogicFactory("Switch", "Toggles between on and off when clicked.", switchSpriteOff);
    
    globalvar padSpriteOff;
    padSpriteOff = sprite_add("./Sprites/pad_off.png", 0, false, false, 8, 8);
    globalvar padSpriteOn;
    padSpriteOn = sprite_add("./Sprites/pad_on.png", 0, false, false, 8, 8);
    
    globalvar gatePad;
    gatePad = LogicFactory("Pressure Pad", "Turns on when the player is ontop of the node.", padSpriteOff);
    
    globalvar buzzerSpriteOff;
    buzzerSpriteOff = sprite_add("./Sprites/buzzer_off.png", 0, false, false, 8, 8);
    globalvar buzzerSpriteOn;
    buzzerSpriteOn = sprite_add("./Sprites/buzzer_on.png", 0, false, false, 8, 8);
    
    globalvar gateBuzzer;
    gateBuzzer = LogicFactory("Buzzer", "Makes a noise when the inputs are on.", buzzerSpriteOff);
    
    globalvar clockSpriteOff;
    clockSpriteOff = sprite_add("./Sprites/clock_off.png", 0, false, false, 8, 8);
    globalvar clockSpriteOn;
    clockSpriteOn = sprite_add("./Sprites/clock_on.png", 0, false, false, 8, 8);
    
    globalvar gateClock;
    gateClock = LogicFactory("Clock", "Alternates between on and off every update cycle.", clockSpriteOff);
    
    globalvar spriteCircuitMaker;
    spriteCircuitMaker = sprite_add("./Sprites/circuit_maker.png", 0, false, false, 16, 16);
    
    globalvar structCircuitMaker;
    structCircuitMaker = StructureCreate(undefined, "Circuit Maker", "It makes circuits... it's in the name.", StructureType.Base, spriteCircuitMaker, undefined, [Item.Steel, 10, Item.GoldIngot, 20], 2, true, [itemWiringTool, itemWireCutter, itemEdibleElectronic, gateNot[0], gateOr[0], gateAnd[0], gateXor[0], gateNand[0], gateXnor[0], gateMono[0], gateLight[0], gateButton[0], gateSwitch[0], gatePad[0], gateBuzzer[0], gateClock[0]], true, BuildMenuCategory.Industrial, [catWiringTool, catWireCutter, catEdibleElectronic]);
    
    globalvar wireConnections;
    wireConnections = [];
    
    globalvar tempConnect;
    tempConnect = undefined;
    
    globalvar logicWorld;
    logicWorld = ZoneCreate(undefined, "Logic World", ZoneType.Single, 2000, 2000, tilesGrasslands, tilesGrasslands2, tilesDetailsGrassland, []);
    
    globalvar zones;
    zones = [];
    
    globalvar mGates;
    mGates = [];
    
    CommandCreate("logicworld", true, ScriptWrap(GotoCircuitWorld));
    
    Trace("---- Circuit Mod By ArtificialLegacy, Sprites by AzazelFTL ----");

#define LogicFactory(_name, _desc, _sprite)

    var _struct = StructureCreate(undefined, _name, _desc, StructureType.Base, _sprite);
    var _item = ItemCreate(undefined, _name, _desc, _sprite, ItemType.Consumable, ItemSubType.Structure, 100, 0, 0, [Item.Steel, 1, Item.GoldIngot, 5], ScriptWrap(UsePlaceableItem), undefined, true, 0, _struct);

    return [_item, _struct];

#define OnStructureSpawn(_inst, _structure)

    var _struct = getStructure(_structure);

    if (_struct != "NONE") {
        
        _inst.inputs = [];
        _inst.outputs = [];
        _inst.isNode = true;
        _inst.nodeType = _struct;
        _inst.state = false;
        _inst.antiCull = true;
        
        if (_struct == "MONO") _inst.pop = false;
        if (_struct == "SWITCH") _inst.toggle = false;
        if (_struct == "CLOCK") _inst.cycle = false;
        if (_struct == "PAD") _inst.movementCollide = false;
        
    } else {
        _inst.isNode = false;
    }
    
#define OnStructureDestroy(_inst, _structure)

    if (variable_instance_exists(_inst, "isNode")) {
        if (_inst.isNode) {
            for (var i = 0; i < array_length(inputs); i++) {
                for (var z = 0; z < array_length(wireConnections); z++) {
                    if (wireConnections[z][0] == inputs[i] and wireConnections[z][1] == id) RemoveConnection(z);
                }
            }
            
            for (var i = 0; i < array_length(outputs); i++) {
                for (var z = 0; z < array_length(wireConnections); z++) {
                    if (wireConnections[z][1] == outputs[i] and wireConnections[z][0] == id) RemoveConnection(z);
                }
            }
        }
    }
    
#define getStructure(_s)

        
        if (_s == gateNot[1]) {
            return "NOT";
        } else if (_s == gateOr[1]) {
            return "OR";
        } else if (_s == gateAnd[1]) {
            return "AND";
        } else if (_s == gateXor[1]) {
            return "XOR";
        } else if (_s == gateNand[1]) {
            return "NAND";
        } else if (_s == gateXnor[1]) {
            return "XNOR";
        } else if (_s == gateMono[1]) {
            return "MONO";
        } else if (_s == gateLight[1]) {
            return "LIGHT";
        } else if (_s == gateButton[1]) {
            return "BUTTON";
        } else if (_s == gateSwitch[1]) {
            return "SWITCH";
        } else if (_s == gatePad[1]) {
            return "PAD";
        } else if (_s == gateBuzzer[1]) {
            return "BUZZ";
        } else if (_s == gateClock[1]) {
            return "CLOCK";
        } else {
            
            for (var i = 0; i < array_length(mGates); i++) {
                
                if (_s == mGates[i][0]) {
                    
                    return mGates[i][2];
                    
                }
                
            }
            
            return "NONE";
        }
        
#define array_remove(_array, _value)

    var _newArray = [];
    
    for (var i = 0; i < array_length(_array); i++) {
        if (_array[i] != _value) _newArray = array_push(_newArray, _array[i]);
    }
    
    return _newArray;
    
#define __GlowOrderRemove( _inst )
var _glowOrder = variable_global_get("glowOrders");
for(var i = 0; i < ds_list_size(_glowOrder); i++) {
    if (array_get(_glowOrder[| i], 0) == _inst) {
        ds_list_delete(_glowOrder, i);
        return true;
    }
}
return false;