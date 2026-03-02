#define OnStructureInteract(_type, _structure, _inst)

    if (_structure == Structure.Vault) {
        
        if (instance_exists(objStorageInventory)) {
        
            objStorageInventory.maxSlots = _inst.maxSlots;
            
        }
        
    }