#define CreateGlobals

    global.CreativeMenuPos = [240, 75];
    global.descDraw = ["", "", sprUnknownItem];
    global.structureSelect = -1;
    global.gridSnap = true;
    global.scroll = 0;
    global.editSelect = -1;
    global.chestSelect = noone;
    
    global.materials = [];
    global.consumables = [];
    global.itemStructures = [];
    global.gear = [];
    
    global.itemIncrement = 0;
    
    global.itemIncrements = [
        
        ["1", 1],
        ["5", 5],
        ["10", 10],
        ["50", 50],
        ["100", 100],
        ["500", 500],
        ["1k", 1000],
        ["5k", 5000],
        ["10k", 10000],
        ["50k", 50000],
        ["100k", 100000],
        ["500k", 500000],
        ["1m", 1000000],
        ["10m", 10000000],
        ["100m", 100000000],
        ["1b", 1000000000],
        ["10b", 10000000000],
        ["100b", 100000000000],
        ["1t", 1000000000000],
        ["10t", 10000000000000],
        ["100t", 100000000000000],
        ["1qu", 1000000000000000],
        ["10qu", 10000000000000000],
        ["100qu", 100000000000000000],
        ["1qn", 1000000000000000000],
        ["10qn", 10000000000000000000],
        ["100qn", 100000000000000000000],
        ["1qn+", 1000000000000000000000],
        ["10qn+", 10000000000000000000000],
        ["100qn+", 100000000000000000000000],
        
    ];
    
    global.entities = [
    
        [objFairy, sprFairy],
        [objDeathMoth, sprDeathMoth],
        [objTorchBug, sprTorchBug],
        [objButterfly, sprButterfly],
        [objBeetle, sprBeetle],
        
        [objCow, sprCowIdle],
        [objChicken, sprChickenIdle],
        [objSheep, sprSheepIdle],
        [objMagicDeer, sprMagicDeerIdle],
        
        [objSlime, sprSlime],
        [objBoar, sprBoarIdle],
        [objDemon, sprDemonWalk],
        [objThunderSpirit, sprThunderSpirit],
        [objElectricSpikes, sprElectricSpikes],
        [objWatcher, sprWatcher],
        [objWizrob, sprWizrob],
        [objFloatingSkull, sprFloatingSkull],
        [objUndeadBoar, sprUndeadBoarIdle],
        [objSkeleton, sprSkeletonIdle],
        [objSkeletonArcher, sprSkeletonArcherIdle],
        
        [objSlimeKing, sprSlimeKing],
        [objSkeletonKing, sprSkeletonKingIdle],
        [objDarkBeet, sprDarkBeetIdle],
        [objToxicGuardian, sprToxicGuardianIdle],
        
        [objDruid, sprDruid],
        [objWizard, sprWizard],
        [objGoblin, sprGoblin],
        [objFoxmage, sprFoxmage],
        [objHopFrog, sprHopFrogIdle],
        [objGhost, sprGhost],
        [objEngineer, sprEngineer],
        [objFairyQueen, sprFairyQueen],
        [objMiner, sprMiner],
        [objArchaeologist, sprArchaeologist],
        [objOldMan, sprOldMan],
        [objPrincess, sprPrincess],
        [objGrumpy, sprGrumpy],
        [objTrader, sprTrader],
        [objLanternArtifact, sprLanternArtifact],
        [objHaloArtifact, sprHaloArtifact],
        
    ];
    
    global.spawns = [
        
        [objTree, sprTree, 0],
        [objTree, sprTree, 1],
        [objTree, sprTree, 2],
        [objTree, sprTree, 3],
        [objBush, sprBush, 3],
        [objFlower, sprFlowerObject, 3],
        [objCinderbloom, sprCinderbloomObject, 2],
        [objLavender, sprLavenderObject, 2],
        [objVoidRose, sprVoidRose, 0],
        [objWheat, sprWheatObject, 2],
        [objCotton, sprCottonObject, 2],
        [objBeet, sprBeetObject, 2],
        [objHotPepper, sprHotPepperObject, 2],
        [objCactus, sprCactus, 3],
        [objPumpkin, sprPumpkinObject, 2],
        
        [objDigSpot, sprDigSpot, 0],
        
        [objRock, sprRock, 0],
        [objRock, sprRock, 1],
        [objRock, sprRock, 2],
        [objRock, sprRock, 3],
        [objRock, sprRock, 4],
        [objRock, sprRock, 5],
        [objRock, sprRock, 6],
        [objRock, sprRock, 7],
        [objGrave, sprGrave, 0],
        [objGrave, sprGrave, 1],
        [objGrave, sprGrave, 2],
        [objGrave, sprGrave, 3],
        [objCrystal, sprCrystalObject, 0],
        [objCrystal, sprCrystalObject, 1],
        [objCrystal, sprCrystalObject, 2],
        [objCrystal, sprCrystalObject, 3],
        [objVolcanoRock, sprVolcanoRock, 0],
        [objVolcanoRock, sprVolcanoRock, 1],
        [objVolcanoRock, sprVolcanoRock, 2],
        [objVolcanoRock, sprVolcanoRock, 3],
        [objVolcanoRock, sprVolcanoRock, 4],
        [objVolcanoRock, sprVolcanoRock, 5],
        [objObsidianRock, sprObsidianRock, 0],
        [objVoidstoneRock, sprVoidstoneRock, 0],
        [objDesertRock, sprDesertRock, 0],
        [objDesertRock, sprDesertRock, 1],
        [objDesertRock, sprDesertRock, 2],
        [objDesertRock, sprDesertRock, 3],
        [objDesertRock, sprDesertRock, 4],
        [objDesertRock, sprDesertRock, 5],
        [objDesertRock, sprDesertRock, 6],
        [objDesertRock, sprDesertRock, 7],
        [objVolcanoRockBig, sprVolcanoRockBig, 0],
        [objVolcanoRockBig, sprVolcanoRockBig, 1],
        [objVolcanoRockBig, sprVolcanoRockBig, 2],
        [objVolcanoRockBig, sprVolcanoRockBig, 3],
        [objVolcanoRockBig, sprVolcanoRockBig, 4],
        [objVolcanoRockBig, sprVolcanoRockBig, 5],
        [objUraniumRock, sprUraniumOre, 0],
        
    ];
    
    global.buildings = [
        
        [objPushDownPillar, sprPushDownPillar1, 0],
        [objPushDownPillar, sprPushDownPillar2, 0],
        [objPushDownPillar, sprPushDownPillar3, 0],
        [objPushDownPillar, sprPushDownPillar4, 0],
        [objDruidTree, sprDruidTree, 0],
        [objWardrobe, sprWardrobe, 0],
        [objGiantBeet, sprGiantBeetAIdle, 0],
        [objGiantBeetSmaller, sprGiantBeetBIdle, 0],
        [objRainbow, sprRainbow, 0],
        [objFairyPond, sprFairyPond, 0],
        [objMuseum, sprMuseum, 0],
        
        [objEyeStatue, sprEyeStatue, 0],
        [objReceptorBig, sprReceptorBig, 0],
        [objPictographMonolith, sprPictographMonolith, 0],
        
        [objSleepingStatue, sprSleepingStatue, 0],
        [objGiantCrystal, sprGiantCrystal, 0],
        [objComputerTerminal, sprComputerTerminal, 0],
        
        [objRunicPillar, sprVolcanoPushDownPillar, 0],
        [objBloodAltar, sprBloodAltar, 0],
        [objWizardTower, sprWizardTower, 0],
        [objBookcase, sprBookcase, 0],
        [objSlimePortal, sprBell, 0],
        
        [objGemSocketPillar, sprSocketGemPillar, 0],
        [objGemSocketPillar, sprSocketGemPillar, 1],
        [objGemSocketPillar, sprSocketGemPillar, 2],
        [objGemSocketPillar, sprSocketGemPillar, 3],
        [objGemSocketPillar, sprSocketGemPillar, 4],
        [objBonePile, sprBonePile, 0],
        [objSkullBrazier, sprSkullBrazier, 0],
        [objBell, sprBell, 0],
        
        [objRunicHint, sprRuneHints, 0],
        [objRunicHint, sprRuneHints, 1],
        [objRunicHint, sprRuneHints, 2],
        [objRunicHint, sprRuneHints, 3],
        
        [objDungeonLantern, sprLanternAncientTomb, 0],
        [objSpaceTower, sprSpaceTowers, 0],
        [objElectricCube, sprElectricCube, 0],
        [objReceptor, sprReceptor, 0],
        [objElectricBarrier, sprElectricBarrier, 0],
        
        [objMirror, sprMirror, 0],
        [objMinecart, sprMinecart, 0],
        
        [objFireTurret, sprFireCannons, 0],
        [objFireTempleBrazier, sprFireTempleLantern, 0],
        
        [objTreasureChest, sprTreasureChest, 0],
        [objTreasureChestSmall, sprTreasureChestSmall, 0],
        [objTreasureChestVoid, sprTreasureChestVoid, 0],
        
        [objObelisk, sprObeliskForaging, 0],
        [objObelisk, sprObeliskMining, 0],
        [objObelisk, sprObeliskLumberjacking, 0],
        [objObelisk, sprObeliskCrafting, 0],
        [objObelisk, sprObeliskCombat, 0],
        
    ];
    
    global.obliterateObjects = [
        
        parNPC,
        parEntity,
        parCritter,
        parObject,
        parHerb,
        objBridge,
        objModNPC,
        objDruidTree,
        objMuseum,
        objFairyPond,
        objWizardTower,
        objSpaceTower,
        objRainbow,
        objTreasureChest,
        objTreasureChestSmall,
        objTreasureChestVoid,
        objElectricCube,
        objReceptor,
        objMirror,
        objMinecart,
        objComputerTerminal,
        objWardrobe,
        objSlimePortal,
        objDigSpot,
        
    ];
    
    