#define InitItems

    ItemEdit(Item.Berry, ItemData.Description, "these berries look tasty... too tasty...")
    ItemEdit(Item.Berry, ItemData.Energy, 3)
    
    ItemEdit(Item.Citrus, ItemData.Name, "orange");
    ItemEdit(Item.Citrus, ItemData.Description, "this orange is not yours")
    ItemEdit(Item.Citrus, ItemData.Energy, 10);
    ItemEdit(Item.Citrus, ItemData.Healing, 1);
    
    ItemEdit(Item.Wood, ItemData.Blueprint, [global.Item_Stick, 20]);
    ItemEdit(Item.Stone, ItemData.Blueprint, [global.Item_Pebble, 20]);
    
    GearEdit(Gear.Pickaxe, GearData.Toolbar, false);
    
    ItemEdit(Item.BasicPickaxe, ItemData.Name, "stone pickaxe");
    ItemEdit(Item.BasicPickaxe, ItemData.Description, "A step up from a wooden pick.");
    ItemEdit(Item.BasicPickaxe, ItemData.CraftingTime, 600);
    ItemEdit(Item.BasicPickaxe, ItemData.Blueprint, [Item.Stone, 30, Item.Wood, 20]);
    ItemEdit(Item.BasicPickaxe, ItemData.OnUse, ScriptWrap(UseStonePickaxe));
    
    ItemEdit(Item.SlimePickaxe, ItemData.OnUse, ScriptWrap(UseSlimePickaxe));
    ItemEdit(Item.GoldenPickaxe, ItemData.OnUse, ScriptWrap(UseGoldenPickaxe));
    ItemEdit(Item.SkullPickaxe, ItemData.OnUse, ScriptWrap(UseSkullPickaxe));
    
    ItemEdit(Item.SlimePickaxe, ItemData.Description, "Resources can drop jelly.");
    ItemEdit(Item.GoldenPickaxe, ItemData.Description, "Resources can drop coins.");
    ItemEdit(Item.SkullPickaxe, ItemData.Description, "Resources can drop bone fragments.");
    
    ItemEdit(Item.Coal, ItemData.Blueprint, [global.Item_Stick, 4]);
    
    ItemEdit(Item.GoldIngot, ItemData.Description, "it's heavy and shiny.");
    
    ItemEdit(Item.FruitSalad, ItemData.Blueprint, [global.Item_WoodenBowl, 1, Item.Berry, 2, Item.Citrus, 2, Item.CactusFruit, 2]);
    ItemEdit(Item.Soup, ItemData.Blueprint, [global.Item_WoodenBowl, 1, Item.BottledMilk, 1,  Item.Beet, 1, Item.Pumpkin, 1]);
    
#define InitStructures

    StructureEdit(Structure.Forge, StructureData.GearCategories, [global.Gear_Pickaxe]);
    
    StructureEdit(Structure.FishTrap, StructureData.Blueprint, [global.Item_FishTrap, 1]);
    
    StructureEdit(Structure.CarpentryStation, StructureData.Items, array_push(StructureGet(Structure.CarpentryStation, StructureData.Items), global.Item_DyeVat));
    
#define InitPlayer

    objPlayer.frLevel = 0;
    objPlayer.frXp = 0;
    objPlayer.frXpCap = 25;
    objPlayer.frXpUp = 8;
    
    objPlayer.slingshotCharge = 0;
    
    objPlayer.currentGUI = [noone, noone];
    objPlayer.questsOpen = false;
    
    objPlayer.primaryQuest = noone;
    objPlayer.secondaryQuests = [noone, noone];
    objPlayer.dailyQuest = noone;
    objPlayer.questComplete = [];
    objPlayer.questCompleteTimer = 0;
    
    objPlayer.vaultOpen = noone;
    
    objPlayer.selectFrame = 0;
    var _inst = ModObjectSpawn(0, 0, 0);
    InstanceAssignMethod(_inst, "draw", ScriptWrap(SelectionDraw), true);
    InstanceAssignMethod(_inst, "step", ScriptWrap(SelectionStep), true);
    
#define InitTimeControl

    TimeControl.moonPhase = MoonStates.NewMoon;
    
#define InitEnemyController

    global.Control_EnemySpawner = ModObjectSpawn(0, 0, 0);
    
    with (global.Control_EnemySpawner) {
        
        spawnTimer = 0;
        spawnTime = irandom_range(100, 200);
        
        spawns = [SpawnSlime, SpawnSkeleton, SpawnBoar];
        
    }
    
    InstanceAssignMethod(global.Control_EnemySpawner, "step", ScriptWrap(EnemySpawnerStep), true);
    