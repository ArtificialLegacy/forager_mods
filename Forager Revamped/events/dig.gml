#define OnDigCustom(_x, _y)

    if (GetBiome(_x, _y) == Biome.Snow and irandom_range(0, 1) == 0) {
        
        DropItem(_x, _y, global.Item_Snowball, irandom_range(1, 2));
        
    }