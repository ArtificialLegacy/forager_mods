#define InitQuests()

    global.quests = ds_map_create();

#define CreateQuest(_questid, _item, _description)

    var _quest = [_item, _description];

    ds_map_set(global.quests, _questid, _quest);