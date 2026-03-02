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