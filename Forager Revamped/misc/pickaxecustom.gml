#define UseCustomPickaxe(_damage, _energy, _stickDrops, _fruitRate, _fruitDrops, _poisonRate, _poisonDrops, _berryDrops, _berryBreak, _pebbleDrops, _ironMine, _ironRate, _ironDrops)

    var _selected = GetSelection();
    
    if (_selected == noone) return;
    
    var _hitSomething = [_selected.x, _selected.y];
    
    if (_selected.object_index == objTree) {
        
        DropItem(_selected.x, _selected.y, global.Item_Stick, irandom_range(_stickDrops[0], _stickDrops[1]));
        
        if (irandom_range(0, _fruitRate) == 0) {
            
            if (TimeControl.lightState == 3 and TimeControl.moonPhase == MoonStates.BloodMoon) {
                
                DropItem(_selected.x, _selected.y, global.Item_BloodiedFruit, irandom_range(_fruitDrops[0], _fruitDrops[1]));
                
            } else {
            
                switch (GetBiome(_selected.x, _selected.y)) {
                
                    case Biome.Grass: DropItem(_selected.x, _selected.y, Item.Citrus, irandom_range(_fruitDrops[0], _fruitDrops[1])); break;
                    
                    case Biome.Desert: DropItem(_selected.x, _selected.y, global.Item_Pineapple, irandom_range(_fruitDrops[0], _fruitDrops[1])); break;
                    
                    case Biome.Graveyard: DropItem(_selected.x, _selected.y, global.Item_BoneApple, irandom_range(_fruitDrops[0], _fruitDrops[1])); break;
                    
                    case Biome.Snow: DropItem(_selected.x, _selected.y, global.Item_FrostFruit, irandom_range(_fruitDrops[0], _fruitDrops[1])); break;
                    
                    case Biome.Volcano: DropItem(_selected.x, _selected.y, global.Item_Magmapple, irandom_range(_fruitDrops[0], _fruitDrops[1])); break;
                    
                }
                
            }
            
        }
        
        _selected.hp -= _damage;
        
        OnResourceHit(_selected);
        
        if (_selected.hp <= 0) {
            
            OnResourceDestroyCustom(_selected);
            instance_destroy(_selected, false);
            
        }
        
        objPlayer.energy -= _energy;
        
    } else if (_selected.object_index == objBush) {
        
        if (irandom_range(0, _poisonRate) == 0) {
            
            DropItem(_selected.x, _selected.y, global.Item_PoisonBerry, irandom_range(_poisonDrops[0], _poisonDrops[1]));
            
        } else {
            
            if (GetBaseIDDaily(GetQuestID(objPlayer.dailyQuest)) == DailyQuest.GoldenBerry and irandom_range(0, 10) == 0) {
                
                DropItem(_selected.x, _selected.y, global.Item_GoldenBerry, irandom_range(3, 5));
                QuestCompleteDaily(GetDailyID(DailyQuest.GoldenBerry));
                
            } else {
                
                DropItem(_selected.x, _selected.y, Item.Berry, irandom_range(_berryDrops[0], _berryDrops[1]));
                
            }
            
        }
        
        objPlayer.energy -= _energy;
        
        OnResourceHit(_selected);
        
        if (irandom_range(0, _berryBreak) == 0) {
            
            OnResourceDestroyCustom(_selected);
            instance_destroy(_selected, false);
            
        }
        
    } else if (_selected.object_index == objRock) {
        
        if (_selected.image_index == 0 or _selected.image_index == 1) {
            
            DropItem(_selected.x, _selected.y, global.Item_Pebble, irandom_range(_pebbleDrops[0], _pebbleDrops[1]));
            
            _selected.hp -= _damage;
            
            OnResourceHit(_selected);
            
            if (_selected.hp <= 0) {
                
                OnResourceDestroyCustom(_selected);
                instance_destroy(_selected, false);
                
            }
            
            objPlayer.energy -= _energy;
            
        } else if (_selected.image_index == 2 or _selected.image_index == 3 and _ironMine) {
            
            if (irandom_range(0, _ironRate) == 0) DropItem(_selected.x, _selected.y, Item.IronOre, irandom_range(_ironDrops[0], _ironDrops[1]));
            
            _selected.hp -= _damage;
            
            OnResourceHit(_selected);
            
            if (_selected.hp <= 0) {
                
                OnResourceDestroyCustom(_selected);
                instance_destroy(_selected, false);
                
            }
            
            objPlayer.energy -= _energy;
            
        }
        
    } else if (object_is_ancestor(_selected.object_index, parStructure)) {
        
        _selected.hp -= _damage;
        
        OnStructureHit(_selected);
        
    } else if (object_is_ancestor(_selected.object_index, parHerb)) {
        
        OnResourceHit(_selected);
        OnResourceDestroyCustom(_selected);
        instance_destroy(_selected, true);
        
    } else {
        
        _hitSomething = noone;
        
    }
    
    if (_hitSomething != noone) {
        
        if (GetSaveKey("obtained_slime_pickaxe")) {
            
            if (irandom_range(0, 5) == 0) DropItem(_hitSomething[0], _hitSomething[1], Item.Jelly, irandom_range(1, 2));
            
        }
        
        if (GetSaveKey("obtained_golden_pickaxe")) {
            
            if (irandom_range(0, 5) == 0) DropItem(_hitSomething[0], _hitSomething[1], Item.Coin, irandom_range(1, 2));
            
        }
        
        if (GetSaveKey("obtained_skull_pickaxe")) {
            
            if (irandom_range(0, 10) == 0) DropItem(_hitSomething[0], _hitSomething[1], global.Item_BoneFragment, irandom_range(5, 10));
            
        }
        
    }