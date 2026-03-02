#define CombatComplete

    global.Data_TempSkills[? "skill_smelting"] =  UNLOCKED;
    global.Data_TempSkills[? "skill_foraging"] = UNLOCKED;
    global.Data_TempSkills[? "skill_gold"] = UNLOCKED;
    global.Data_TempSkills[? "skill_carpentry"] = UNLOCKED;
    ItemEdit(global.Item_WoodenSword, ItemData.Unlocked, true);

#define SmeltingComplete

    global.Data_TempSkills[? "skill_advanced smelting"] = UNLOCKED;
    global.Data_TempSkills[? "skill_sewing"] = UNLOCKED;
    ItemEdit(global.Item_Smeltry, ItemData.Unlocked, true);

#define ForagingComplete

    global.Data_TempSkills[? "skill_seeds"] = UNLOCKED;
    global.Data_TempSkills[? "skill_pet"] = UNLOCKED;

#define SeedsComplete

    global.Data_TempSkills[? "skill_fishing"] = UNLOCKED;
    global.Data_TempSkills[? "skill_cooking"] = UNLOCKED;
    ItemEdit(global.Item_SeedPress, ItemData.Unlocked, true);

#define GoldComplete

    global.Data_TempSkills[? "skill_gold lust"] = UNLOCKED;

#define PetComplete

    var _skillUnlocks = variable_global_get("skillUnlocked");
    _skillUnlocks[Skill.Pet] = OBTAINED;
    
#define AdvancedSmeltingComplete

    ItemEdit(Item.Steel, ItemData.Unlocked, true);
    ItemEdit(Item.Glass, ItemData.Unlocked, true);
    
    global.Data_TempSkills[? "skill_furnace"] = UNLOCKED;
    
#define FishingComplete

    ItemEdit(Item.FishingRod, ItemData.Unlocked, true);
    
    global.Data_TempSkills[? "skill_hunting"] = UNLOCKED;

#define HuntingComplete

    

#define CarpentryComplete

    global.Data_TempSkills[? "skill_dyes"] = UNLOCKED;
    global.Data_TempSkills[? "skill_masonry"] = UNLOCKED;
    
    ItemEdit(global.Item_CarpentryStation, ItemData.Unlocked, true);

#define MasonryComplete

    ItemEdit(global.Item_MasonryTable, ItemData.Unlocked, true);
    global.Data_TempSkills[? "skill_railroad"] = UNLOCKED;

#define SewingComplete

    ItemEdit(global.Item_SewingStation, ItemData.Unlocked, true);

#define CookingComplete

    ItemEdit(Item.Sugar, ItemData.Unlocked, true);
    ItemEdit(Item.Mayo, ItemData.Unlocked, true);
    ItemEdit(Item.Cheese, ItemData.Unlocked, true);

#define FurnaceComplete

    

#define DyesComplete

    ItemEdit(global.Item_DyeVat, ItemData.Unlocked, true);

#define RailroadComplete

    ItemEdit(Item.Railroad, ItemData.Unlocked, true);
    ItemEdit(Item.Locomotive, ItemData.Unlocked, true);
    
#define GoldLustComplete

    