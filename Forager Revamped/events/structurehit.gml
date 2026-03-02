#define OnStructureHit(_inst)

    if (_inst.hp <= 0) {

        if (_inst.object_index == objVault) {
            
            if (_inst.maxSlots == 2) {
                
                DropItem(_inst.x, _inst.y, global.Item_WoodenCrate, 1);
                instance_destroy(_inst, false);
                
            }
            
        }
        
    }