#define Main

    #region ModData
    
        global.Data_SaveMap = ds_map_create();
        
        global.Data_Quests = ds_map_create();
        global.Data_Skills = ds_map_create();
        
        global.Data_TempSkills = ds_map_create();
        
        global.LeaveSkill = false;
        global.TempSkillPoints = 0;
        
        global.Data_Dyes = [];
    
    #endregion
    
    #region Controllers
    
        global.Control_EnemySpawner = noone;
    
    #endregion
    
    #region PlayerTiers
    
        enum PlayerPickaxeTiers {
            
            Fist,
            Stone,
            Slime,
            Skull,
            
        }
        
        enum PlayerSwordTiers {
            
            Wood,
            Stone,
            Slime,
            Skull,
            
        }
        
        enum PlayerShovelTiers {
            
            Wood,
            Stone,
            
        }
    
    #endregion

    CompileSprites();
    
    #region Skills
    
        #macro UNDISCOVERED -1
        #macro LOCKED 0
        #macro UNLOCKED 1
        #macro OBTAINED 2
    
        enum Skills {
            
            Combat,
            Smelting,
            Foraging,
            Seeds,
            Gold,
            Pet,
            AdvancedSmelting,
            Fishing,
            Hunting,
            Carpentry,
            Masonry,
            Sewing,
            Cooking,
            Furnace,
            Dyes,
            Railroad,
            GoldLust,
            
            Count,
            
        }
        
        global.Skill_Combat = CreateSkill(Skills.Combat, "combat", "U unlocks swords.", Skill.Combat, sprSkillBorderMagic, CombatComplete);
        global.Skill_Smelting = CreateSkill(Skills.Smelting, "smelting", "U unlocks the smeltery.", Skill.Industry, sprSkillBorderIndustry, SmeltingComplete);
        global.Skill_Foraging = CreateSkill(Skills.Foraging, "foraging", "U makes berries less poisonous.", Skill.Foraging, sprSkillBorderForaging, ForagingComplete);
        global.Skill_Seeds = CreateSkill(Skills.Seeds, "seeds", "U unlocks the seed press.\n\nU allows the slingshot to shoot seeds.", Skill.Gathering, sprSkillBorderForaging, SeedsComplete);
        global.Skill_Gold = CreateSkill(Skills.Gold, "gold", "U enemies drop more coins.", Skill.Economy, sprSkillBorderEconomy, GoldComplete);
        global.Skill_Pet = CreateSkill(Skills.Pet, "pet", "U spawns a friendly companion.", Skill.Pet, sprSkillBorderForaging, PetComplete);
        global.Skill_AdvancedSmelting = CreateSkill(Skills.AdvancedSmelting, "advanced smelting", "U unlocks glass.\n\nU unlocks steel.", Skill.Smelting, sprSkillBorderIndustry, AdvancedSmeltingComplete);
        global.Skill_Fishing = CreateSkill(Skills.Fishing, "fishing", "U unlocks fishing rods.", Skill.Fishing, sprSkillBorderForaging, FishingComplete);
        global.Skill_Hunting = CreateSkill(Skills.Hunting, "hunting", "U unlocks bows.\n\nU unlocks arrows.\n\nU unlocks poison arrows.", Skill.Hunting, sprSkillBorderForaging, HuntingComplete);
        global.Skill_Carpentry = CreateSkill(Skills.Carpentry, "carpentry", "U unlocks carpentry stations.", Skill.Carpentry, sprSkillBorderIndustry, CarpentryComplete);
        global.Skill_Masonry = CreateSkill(Skills.Masonry, "masonry", "U unlocks masonry tables.\n\nU unlocks hammer.", Skill.Masonry, sprSkillBorderIndustry, MasonryComplete);
        global.Skill_Sewing = CreateSkill(Skills.Sewing, "sewing", "U unlocks sewing stations.\n\nU unlocks backpacks.\n\nU unlocks wallets.", Skill.Sewing, sprSkillBorderIndustry, SewingComplete);
        global.Skill_Cooking = CreateSkill(Skills.Cooking, "cooking", "U unlocks cookpots.\n\nU unlocks sugar.\n\nU unlocks mayonnaise.\n\nU unlocks cheese.", Skill.Cooking, sprSkillBorderForaging, CookingComplete);
        global.Skill_Furnace = CreateSkill(Skills.Furnace, "furnace", "U unlocks furnaces.", Skill.Craftsmanship, sprSkillBorderIndustry, FurnaceComplete);
        global.Skill_Dyes = CreateSkill(Skills.Dyes, "dyes", "U unlocks dye vats.", Skill.Gathering, sprSkillBorderIndustry, DyesComplete);
        global.Skill_Railroad = CreateSkill(Skills.Railroad, "railroad", "U unlocks locomotives.\n\nU unlocks railroads.", Skill.Railroads, sprSkillBorderIndustry, RailroadComplete);
        global.Skill_GoldLust = CreateSkill(Skills.GoldLust, "gold lust", "U enemies drop even more coins.", Skill.Economy, sprSkillBorderEconomy, GoldLustComplete);
    
    #endregion
    
    #region Items
    
        global.Item_Fist = ItemCreate(undefined, "fist", "Use this to punch.", global.Sprite_Fist, ItemType.Gear, ItemSubType.None, 0, 0, 0, undefined, ScriptWrap(UseFist));
        
        global.Item_Pebble = ItemCreate(undefined, "Pebble", "Fun to throw.", global.Sprite_Pebble, ItemType.Material, ItemSubType.None, 1);
        global.Item_Stick = ItemCreate(undefined, "Stick", "Fun to poke people with.", global.Sprite_Stick, ItemType.Material, ItemSubType.None, 1);
        
        global.Item_PoisonBerry = ItemCreate(undefined, "poison berry", "i don't know about this one...", global.Sprite_PoisonBerry, ItemType.Consumable, undefined, 1, -1, 3, null, ScriptWrap(UsePosionBerry), undefined, true, 0)
        
        global.Item_InfectedJelly = ItemCreate(undefined, "infected jelly", "seems very deadly, is probably infected.", global.Sprite_InfectedJelly, ItemType.Material, ItemSubType.None, 1);
        
        global.Item_WoodenPickaxe = ItemCreate(undefined, "wooden pickaxe", "a very weak pickaxe.", global.Sprite_WoodenPickaxe, ItemType.Gear, ItemSubType.None, 0, 0, 0, [Item.Wood, 10], ScriptWrap(UseWoodenPickaxe), 600, true, 1);
        global.Item_WoodenSword = ItemCreate(undefined, "wooden sword", "a very weak sword.", global.Sprite_WoodenSword, ItemType.Gear, ItemSubType.None, 0, 0, 0, [Item.Wood, 15], ScriptWrap(UseWoodenSword), 600, false, 0.5);
        
        global.Item_WoodenShovel = ItemCreate(undefined, "wooden shovel", "a simple shovel", global.Sprite_WoodenShovel, ItemType.Gear, ItemSubType.None, 0, 0, 0, [Item.Wood, 10], ScriptWrap(UseWoodenShovel), 600, true);
        
        global.Item_Slingshot = ItemCreate(undefined, "slingshot", "you can shoot pebbles with this!", global.Sprite_Slingshot, ItemType.Gear, undefined, undefined, undefined, undefined, [global.Item_Stick, 35, Item.Fiber, 10], ScriptWrap(EmptyScript), 60 * 20, true, 0);
        
        global.Item_StoneSword = ItemCreate(undefined, "stone sword", "a blunt sword, but has some weight behind it.", global.Sprite_StoneSword, ItemType.Gear, ItemSubType.None, 0, 0, 0, [Item.Stone, 20, global.Item_Stick, 5], ScriptWrap(UseStoneSword), 600, true, 1);
        
        global.Item_Snowball = ItemCreate(undefined, "snowball", "fun to throw at people.", global.Sprite_Snowball, ItemType.Consumable, ItemSubType.None, 0, 0, 0, [], ScriptWrap(UseSnowball));
        global.Item_Shuriken = ItemCreate(undefined, "shuriken", "you can throw this.", global.Sprite_Shuriken, ItemType.Consumable, ItemSubType.None, 1, 0, 0, [], ScriptWrap(UseShuriken));
        global.Item_AncientBone = ItemCreate(undefined, "ancient bone", "might be throwable.", global.Sprite_AncientBone, ItemType.Consumable, ItemSubType.None, 1, 0, 0, [], ScriptWrap(UseAncientBone));
        global.Item_ThrowingKnife = ItemCreate(undefined, "throwing knife", "effective at long ranged stabbing.", global.Sprite_ThrowingKnife, ItemType.Consumable, ItemSubType.None, 1, 0, 0, [], ScriptWrap(UseThrowingKnife));
        
        global.Item_BoneFragment = ItemCreate(undefined, "bone fragment", "can be used to stab things.", global.Sprite_BoneFragment, ItemType.Consumable, ItemSubType.None, 1, 0, 0, [Item.IronIngot, 2], ScriptWrap(UseBoneFragment), 0, true, 1);
        
        global.Item_SewingStation = ItemCreate(undefined, "sewing station", StructureGet(Structure.SewingStation, StructureData.Description), global.Sprite_SewingStation, ItemType.Consumable, ItemSubType.Structure, 15, 0, 0, [Item.Wood, 10, Item.Fiber, 10], ScriptWrap(UseSewingStation), 600, false, 0, Structure.SewingStation);
        global.Item_FishTrap = ItemCreate(undefined, "fish trap", StructureGet(Structure.FishTrap, StructureData.Description), sprFishTrap, ItemType.Consumable, ItemSubType.None, 10, 0, 0, [Item.Wood, 5, Item.Berry, 5], ScriptWrap(UseFishTrap), 600, true, 0, Structure.FishTrap);
        global.Item_CarpentryStation = ItemCreate(undefined, "carpentry station", StructureGet(Structure.CarpentryStation, StructureData.Description), global.Sprite_CarpentryStation, ItemType.Consumable, ItemSubType.Structure, 10, 0, 0, [Item.Wood, 15, Item.Brick, 15], ScriptWrap(UseCarpentryStation), 600, false, 0, Structure.CarpentryStation);
        global.Item_MasonryTable = ItemCreate(undefined, "masonry table", StructureGet(Structure.MasonryTable, StructureData.Description), global.Sprite_MasonryStation, ItemType.Consumable, ItemSubType.Structure, 10, 0, 0, [Item.Stone, 15, Item.Brick, 15], ScriptWrap(UseMasonryTable), 600, false, 0, Structure.MasonryTable);
        global.Item_CookPot = ItemCreate(undefined, "cooking pot", StructureGet(Structure.Cookpot, StructureData.Description), global.Sprite_CookPot, ItemType.Consumable, ItemSubType.Structure, 10, 0, 0, [Item.Stone, 40, Item.Brick, 40, Item.Coal, 10], ScriptWrap(UseCookpot), 600, false, 0, Structure.Cookpot);
        
        global.Item_WoodenBowl = ItemCreate(undefined, "wooden bowl", "i could make a sweet salad with this...", global.Sprite_WoodenBowl, ItemType.Material, undefined, 2, 0, 0, [global.Item_Stick, 5]);
        global.Item_BerrySalad = ItemCreate(undefined, "berry salad", "this looks berry good...", global.Sprite_BerrySalad, ItemType.Consumable, undefined, 2, 1, 20, [global.Item_WoodenBowl, 1, global.Item_PoisonBerry, 3, Item.Berry, 5], ScriptWrap(UseBerrySalad));
        global.Item_OrangeJuice = ItemCreate(undefined, "orange juice", "oh boy this looks like citrus in a bottle", global.Sprite_OrangeJuice, ItemType.Consumable, undefined, 2, 2, 30, [Item.Bottle, 1, Item.Citrus, 5], ScriptWrap(UseOrangeJuice));
        global.Item_Pineapple = ItemCreate(undefined, "pineapple", "not actually an apple.", global.Sprite_Pineapple, ItemType.Consumable, ItemSubType.None, 1, 1, 10, [], ScriptWrap(UsePineapple));
        global.Item_FrostFruit = ItemCreate(undefined, "frost fruit", "very cold, but edible.", global.Sprite_FrostFruit, ItemType.Consumable, ItemSubType.None, 1, 1, 10, [], ScriptWrap(UseFrostFruit));
        global.Item_BoneApple = ItemCreate(undefined, "bone apple", "you can probably eat this?", global.Sprite_BoneApple, ItemType.Consumable, ItemSubType.None, 1, 1, 10, [], ScriptWrap(UseBoneApple));
        global.Item_Magmapple = ItemCreate(undefined, "magmapple", "very hot, but edible.", global.Sprite_Magmapple, ItemType.Consumable, ItemSubType.None, 1, 1, 10, [], ScriptWrap(UseMagmapple));
        global.Item_BloodiedFruit = ItemCreate(undefined, "bloodied fruit", "could be eaten... maybe?", global.Sprite_BloodiedFruit, ItemType.Consumable, ItemSubType.None, 1, 1, 10, [], ScriptWrap(UseBloodiedFruit));
        global.Item_GoldenBerry = ItemCreate(undefined, "golden berry", "not very tasty, but very nutritious.", global.Sprite_GoldenBerry, ItemType.Consumable, ItemSubType.None, 1, 2, 30, [], ScriptWrap(UseGoldenBerry));
        
        global.Item_WhiteDye = CreateDye("white", 255255255, global.Sprite_WhiteDye, [Item.Bottle, 1, Item.BottledMilk, 1]);
        global.Item_BloodOrangeDye = CreateDye("blood orange", make_color_rgb(166, 26, 2), global.Sprite_BloodOrangeDye, [Item.Bottle, 1, Item.Berry, 1, Item.Citrus, 1]);
        global.Item_BloodRedDye = CreateDye("blood red", make_color_rgb(97, 0, 0), global.Sprite_BloodRedDye, [Item.Bottle, 1, Item.Berry, 1, Item.HotPepper, 1]);
        global.Item_BlueGreenDye = CreateDye("blue green", make_color_rgb(0, 171, 105), global.Sprite_BlueGreenDye, [Item.Bottle, 1, Item.BottledWater, 1, Item.Seaweed, 1]);
        global.Item_BlurpleDye = CreateDye("blurple", make_color_rgb(64, 0, 255), global.Sprite_BlurpleDye, [Item.Bottle, 1, Item.BottledWater, 1, Item.PurplePigment, 1]);
        global.Item_CrimsonDye = CreateDye("crimson", make_color_rgb(220, 20, 60), global.Sprite_CrimsonDye, [Item.Bottle, 1, Item.HotPepper, 1, Item.PurplePigment, 1]);
        global.Item_DarkBlueDye = CreateDye("dark blue", make_color_rgb(0, 13, 84), global.Sprite_DarkBlueDye, [Item.Bottle, 1, Item.BottledWater, 1, Item.NightShade, 1]);
        global.Item_DarkGrayDye = CreateDye("dark gray", make_color_rgb(56, 56, 56), global.Sprite_DarkGrayDye, [Item.Bottle, 1, Item.Coal, 1]);
        global.Item_GoldDye = CreateDye("gold", make_color_rgb(207, 181, 59), global.Sprite_GoldDye, [Item.Bottle, 1, Item.GoldIngot, 1]);
        global.Item_LightBlueDye = CreateDye("light blue", make_color_rgb(61, 249, 255), global.Sprite_LightBlueDye, [Item.Bottle, 1, Item.IronIngot, 1, Item.BottledWater, 1, Item.BottledMilk, 1]);
        global.Item_LimeYellowDye = CreateDye("lime yellow", make_color_rgb(208, 255, 66), global.Sprite_LimeYellowDye, [Item.Bottle, 1, Item.Jelly, 1, Item.GoldOre, 1]);
        global.Item_MagentaDye = CreateDye("magenta", make_color_rgb(255, 0, 255), global.Sprite_MagentaDye, [Item.Bottle, 1, Item.Beet, 1, Item.Berry, 1]);
        global.Item_MidnightBlackDye = CreateDye("midnight black", make_color_rgb(0, 0, 0), global.Sprite_MidnightBlackDye, [Item.Bottle, 1, Item.NightShade, 5]);
        global.Item_CoralDye = CreateDye("coral", make_color_rgb(205, 91, 69), global.Sprite_CoralDye, [Item.Bottle, 1, Item.Seaweed, 1, Item.Fish, 1]);
        global.Item_LavenderDye = CreateDye("lavender", make_color_rgb(181, 126, 220), global.Sprite_LavenderDye, [Item.Bottle, 1, Item.Lavender, 1]);
        global.Item_WisteriaDye = CreateDye("wisteria", make_color_rgb(181, 126, 220), global.Sprite_WisteriaDye, [Item.Bottle, 1, Item.Lavender, 1, Item.PurplePigment, 1]);
        global.Item_BrownDye = CreateDye("brown", make_color_rgb(140, 71, 54), global.Sprite_BrownDye, [Item.Bottle, 1, Item.Poop, 1]);
        global.Item_DarkBrownDye = CreateDye("dark brown", make_color_rgb(101, 67, 33), global.Sprite_DarkBrownDye, [Item.Bottle, 1, Item.Poop, 1, Item.Coal, 1]);
        global.Item_LightBrownDye = CreateDye("light brown", make_color_rgb(181,101,29), global.Sprite_LightBrownDye, [Item.Bottle, 1, Item.Poop, 1, Item.BottledMilk, 1]);
        global.Item_MintDye = CreateDye("mint", make_color_rgb(152, 255, 152), global.Sprite_MintDye, [Item.Bottle, 1, Item.Jelly, 1, Item.BottledMilk, 1]);
        
        InitItems();
        
    #endregion
    
    #region Gear
        
        global.Gear_Pickaxe = GearCategoryCreate(undefined, "Pickaxe", true, false);
        GearCategoryAddItems(global.Gear_Pickaxe, global.Item_Fist, global.Item_WoodenPickaxe, Item.BasicPickaxe, Item.SlimePickaxe, Item.GoldenPickaxe, Item.SkullPickaxe);
        
        global.Gear_Sword = GearCategoryCreate(undefined, "Sword", true, false);
        GearCategoryAddItems(global.Gear_Sword, global.Item_WoodenSword, global.Item_StoneSword, Item.SlimeSword, Item.GoldenSword, Item.SkullSword);
        
        global.Gear_Slingshot = GearCategoryCreate(undefined, "SlingShot", true, false);
        GearCategoryAddItems(global.Gear_Slingshot, global.Item_Slingshot);
        
        global.Gear_Shovel = GearCategoryCreate(undefined, "Shovel", true, false);
        GearCategoryAddItems(global.Gear_Shovel, global.Item_WoodenShovel);
        
    #endregion
    
    #region Structures
    
        global.Structure_ImprovisedWorkstation = StructureCreate(undefined, "improvised workstation", "a simple crafting station.", StructureType.Base, global.Sprite_ImprovisedWorkstation, undefined, undefined, 1, true, [], true, undefined, [global.Gear_Pickaxe, global.Gear_Sword]);
        global.Item_ImprovisedWorkstation = ItemCreate(undefined, "improvised workstation", "a simple crafting station.", global.Sprite_ImprovisedWorkstation, ItemType.Consumable, ItemSubType.Structure, 5, 0, 0, [global.Item_Stick, 5, global.Item_Pebble, 5], ScriptWrap(UseImprovisedWorkstation), 20, true, 0, global.Structure_ImprovisedWorkstation);
        StructureEdit(global.Structure_ImprovisedWorkstation, StructureData.Blueprint, [global.Item_ImprovisedWorkstation, 1]);
    
        global.Structure_Workstation = StructureCreate(undefined, "workstation", "a better more sturdy workstation.", StructureType.Base, global.Sprite_Workstation, undefined, undefined, 1, true, [], true, undefined, [global.Gear_Pickaxe, global.Gear_Sword, global.Gear_Shovel]);
        global.Item_Workstation = ItemCreate(undefined, "workstation", "a better more sturdy workstation.", global.Sprite_Workstation, ItemType.Consumable, ItemSubType.Structure, 20, 0, 0, [Item.Wood, 20, Item.Stone, 5], ScriptWrap(UseWorkstation), 300, true, 0, global.Structure_Workstation);
        StructureEdit(global.Structure_Workstation, StructureData.Blueprint, [global.Item_Workstation, 1]);
        
        global.Item_WoodenCrate = ItemCreate(undefined, "wooden crate", "a simple storage item.", global.Sprite_WoodenCrate, ItemType.Consumable, ItemSubType.None, 0, 0, 0, [global.Item_Stick, 15, Item.Wood, 5, Item.Stone, 3], ScriptWrap(UseWoodenCrate), 20, true);
    
        StructureEdit(global.Structure_ImprovisedWorkstation, StructureData.Items, [global.Item_ImprovisedWorkstation, global.Item_Workstation, global.Item_WoodenCrate, Item.Wood, Item.Stone, global.Item_WoodenBowl, global.Item_BerrySalad, global.Item_Fist, global.Item_WoodenSword, global.Item_Slingshot]);
    
        global.Structure_Smeltery = StructureCreate(undefined, "smeltery", "a place to smelt some basic ores.", StructureType.Base, global.Sprite_Smeltery, undefined, undefined, 1, true, [Item.Coal, Item.IronIngot, Item.GoldIngot, Item.Brick, Item.Glass], false);
        global.Item_Smeltery = ItemCreate(undefined, "smeltery", "a place to smelt some basic ores.", global.Sprite_Smeltery, ItemType.Consumable, ItemSubType.Structure, 20, 0, 0, [Item.Stone, 30, Item.IronOre, 5], ScriptWrap(UseSmeltery), 600, false, 0, global.Structure_Smeltery);
        StructureEdit(global.Structure_Smeltery, StructureData.Blueprint, [global.Item_Smeltery, 1]);
        
        global.Structure_Anvil = StructureCreate(undefined, "anvil", "allows you to forge basic items from ores.", StructureType.Base, global.Sprite_Anvil, undefined, undefined, 1, true, [Item.Key, global.Item_Fist, global.Item_WoodenSword, global.Item_WoodenShovel, Item.Hammer, global.Item_ThrowingKnife], true, undefined, [global.Gear_Pickaxe, global.Gear_Sword, global.Gear_Shovel, Gear.Hammer]);
        global.Item_Anvil = ItemCreate(undefined, "anvil", "allows you to forge basic items from ores.", global.Sprite_Anvil, ItemType.Consumable, ItemSubType.Structure, 20, 0, 0, [Item.IronIngot, 10], ScriptWrap(UseAnvil), 600, true, 0, global.Structure_Anvil);
        StructureEdit(global.Structure_Anvil, StructureData.Blueprint, [global.Item_Anvil, 1]);
        
        global.Structure_SeedPress = StructureCreate(undefined, "seed press", "allows you to get seeds.", StructureType.Base, global.Sprite_SeedPress, undefined, undefined, 1, true, [Item.SeedTree, Item.SeedCotton, Item.SeedBeet, Item.SeedWheat, Item.SeedHotPepper, Item.SeedPumpkin, Item.SeedFlower], false);
        global.Item_SeedPress = ItemCreate(undefined, "seed press", "allows you to get seeds.", global.Sprite_SeedPress, ItemType.Consumable, ItemSubType.Structure, 10, 0, 0, [Item.IronIngot, 5, Item.GoldIngot, 5], ScriptWrap(UseSeedPress), 600, false, 0, global.Structure_SeedPress);
        StructureEdit(global.Structure_SeedPress, StructureData.Blueprint, [global.Item_SeedPress, 1]);
        
        global.Structure_DyeVat = StructureCreate(undefined, "Dye Vat", "allows you to make dyes.", StructureType.Base, global.Sprite_DyeVat, undefined, undefined, 1, true, [Item.DyeRemover, Item.BlueDye, Item.TealDye, Item.LimeDye, Item.GreenDye, Item.YellowDye, Item.OrangeDye, Item.RedDye, Item.PinkDye, Item.PurpleDye, Item.GrayDye, Item.BlackDye, global.Item_WhiteDye, global.Item_BloodOrangeDye, global.Item_BloodRedDye, global.Item_BlueGreenDye, global.Item_BlurpleDye, global.Item_CrimsonDye, global.Item_DarkBlueDye, global.Item_DarkGrayDye, global.Item_GoldDye, global.Item_LightBlueDye, global.Item_LimeYellowDye, global.Item_MagentaDye, global.Item_MidnightBlackDye, global.Item_CoralDye, global.Item_LavenderDye, global.Item_WisteriaDye, global.Item_BrownDye, global.Item_DarkBrownDye, global.Item_LightBrownDye, global.Item_MintDye], false);
        global.Item_DyeVat = ItemCreate(undefined, "Dye Vat", "allows you to make dyes.", global.Sprite_DyeVat, ItemType.Consumable, ItemSubType.Structure, 10, 0, 0, [Item.Wood, 25, Item.GreenPigment, 5], ScriptWrap(UseDyeVat), 600, false, 0, global.Structure_DyeVat);
        StructureEdit(global.Structure_DyeVat, StructureData.Blueprint, [global.Item_DyeVat, 1]);
        
        StructureEdit(global.Structure_Workstation, StructureData.Items, [global.Item_FishTrap, global.Item_WoodenCrate, global.Item_SewingStation, global.Item_Smeltery, global.Item_Anvil, global.Item_SeedPress, global.Item_Fist, global.Item_WoodenSword, global.Item_WoodenShovel, Item.FishingRod, Item.Bottle, global.Item_OrangeJuice]);
    
    #endregion
    
    #region Quests
    
        enum PrimaryQuest {
            
            ImprovisedWorkstation,
            WoodenPickaxe,
            WoodenSword,
            Workstation,
            Smeltery,
            Anvil,
            
            Count,
            
        }
        
        enum SecondaryQuest {
            
            Sticks,
            Pebbles,
            Orange,
            PoisonBerry,
            BerrySalad,
            Slingshot,
            WoodenCrate,
            OrangeJuice,
            SewingStation,
            
            Count,
            
        }
        
        enum DailyQuest {
            
            GoldenRock,
            ProsperousTree,
            MoneyRock,
            GoldenBerry,
            
            Tier0Cap,
            
            GoldenSlime,
            
            Tier1Cap,
            
            Count,
            
        }
        
        global.Quest_ImprovisedWorkstation = CreateQuest(PrimaryQuest.ImprovisedWorkstation, "improvised", "place your improvised workstation.", global.Sprite_ImprovisedWorkstation, 5, NullEligible);
        global.Quest_WoodenPickaxe = CreateQuest(PrimaryQuest.WoodenPickaxe, "upgrades", "craft a wooden pickaxe.", global.Sprite_WoodenPickaxe, 10, WoodenPickaxeEligible);
        global.Quest_WoodenSword = CreateQuest(PrimaryQuest.WoodenSword, "combat", "craft a wooden sword.", global.Sprite_WoodenSword, 20, WoodenSwordEligible);
        global.Quest_Workstation = CreateQuest(PrimaryQuest.Workstation, "workstation", "craft and place a workstation.", global.Sprite_Workstation, 40, NullEligible);
        global.Quest_Smeltery = CreateQuest(PrimaryQuest.Smeltery, "smeltery", "craft and place a smeltery.", global.Sprite_Smeltery, 45, NullEligible);
        global.Quest_Anvil = CreateQuest(PrimaryQuest.Anvil, "anvil", "craft and place an anvil.", global.Sprite_Anvil, 45, NullEligible);
        
        global.Quest_Sticks = CreateSecondaryQuest(SecondaryQuest.Sticks, "sticks", "collect 10 sticks.", global.Sprite_Stick, 5, SticksEligible);
        global.Quest_Pebbles = CreateSecondaryQuest(SecondaryQuest.Pebbles, "pebbles", "collect 10 pebbles.", global.Sprite_Pebble, 5, PebblesEligible);
        global.Quest_Orange = CreateSecondaryQuest(SecondaryQuest.Orange, "not citrus", "find an orange.", sprCitrus, 5, OrangeEligible);
        global.Quest_PoisonBerry = CreateSecondaryQuest(SecondaryQuest.PoisonBerry, "tasty... maybe", "eat a poison berry.", global.Sprite_PoisonBerry, 10, NullEligible);
        global.Quest_BerrySalad = CreateSecondaryQuest(SecondaryQuest.BerrySalad, "definitely tasty", "eat a berry salad.", global.Sprite_BerrySalad, 20, NullEligible);
        global.Quest_Slingshot = CreateSecondaryQuest(SecondaryQuest.Slingshot, "slingshot", "shoot a fully charged slingshot.", global.Sprite_Slingshot, 30, NullEligible);
        global.Quest_WoodenCrate = CreateSecondaryQuest(SecondaryQuest.WoodenCrate, "wooden crate", "craft and place a wooden crate.", global.Sprite_WoodenCrate, 30, NullEligible);
        global.Quest_OrangeJuice = CreateSecondaryQuest(SecondaryQuest.OrangeJuice, "orange juice", "drink orange juice.", global.Sprite_OrangeJuice, 15, NullEligible);
        global.Quest_SewingStation = CreateSecondaryQuest(SecondaryQuest.SewingStation, "sewing station", "craft and place a sewing station.", sprSewingStation, 30, NullEligible);
        
        global.Quest_GoldenRock = CreateDailyQuest(DailyQuest.GoldenRock, "golden rock", "locate and mine the golden rock.", global.Sprite_GoldenRock, 5, StartGoldenRockQuest);
        global.Quest_ProsperousTree = CreateDailyQuest(DailyQuest.ProsperousTree, "prosperous tree", "locate a tree that glows with life.", sprTree, 10, StartProsperousTreeQuest);
        global.Quest_MoneyRock = CreateDailyQuest(DailyQuest.MoneyRock, "money rock", "locate a rock that glows with money.", sprRock, 10, StartMoneyRockQuest);
        global.Quest_GoldenSlime = CreateDailyQuest(DailyQuest.GoldenSlime, "golden slime", "locate and kill the golden slime.", global.Sprite_GoldenSlime, 10, StartGoldenSlimeQuest);
        global.Quest_GoldenBerry = CreateDailyQuest(DailyQuest.GoldenBerry, "golden berry", "berry bushes can drop shiny berries.", global.Sprite_GoldenBerry, 10, StartGoldenBerryQuest);
    
    #endregion
    
    #region Moon Phases
    
        enum MoonStates {
        
    	    NewMoon,
    	    CrescentMoon,
    	    HalfMoon,
    	    GibbousMoon,
    	    FullMoon,
    	    GibbousMoon2,
    	    HalfMoon2,
    	    CrescentMoon2,
    	    BloodMoon,
    	    
        }
    
    #endregion
    
    #region GUI
    
        global.GUI_Quests = CreateGUI(DrawQuestGUI, UpdateQuestGUI, true);
    
    #endregion
    
    #region Slime Enums
    
        enum SlimeVariant {
            
            Blue,
            Brown,
            Purple,
            Red,
            Stone,
            Black,
            
        }
    
    #endregion
    
    InitStructures();