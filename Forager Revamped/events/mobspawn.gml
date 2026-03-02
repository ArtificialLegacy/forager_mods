#define OnMobSpawnCustom(_inst)

    if (_inst.object_index == objSlime) {
        
        var _variant = irandom_range(0, 10);
        
        if (_variant <= 5) {
            
            _inst.variant = _variant;
            
            switch (_variant) {
                
                case SlimeVariant.Blue:
                
                    sprite_index = global.Sprite_BlueSlime;
                
                break;
                
                case SlimeVariant.Brown:
                
                    sprite_index = global.Sprite_BrownSlime;
                
                break;
                
                case SlimeVariant.Purple:
                
                    sprite_index = global.Sprite_PurpleSlime;
                
                break;
                
                case SlimeVariant.Red:
                
                    sprite_index = global.Sprite_RedSlime;
                
                break;
                
                case SlimeVariant.Stone:
                
                    sprite_index = global.Sprite_StoneSlime;
                
                break;
                
                case SlimeVariant.Black:
                
                    sprite_index = global.Sprite_BlackSlime;
                
                break;
                
            }
            
        }
        
    }