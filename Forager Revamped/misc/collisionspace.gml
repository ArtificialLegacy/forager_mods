#define CheckCollision(_x, _y)

    return WaterCollision(_x, _y) or instance_place(_x, _y, parObject) != noone or instance_place(_x, _y, parHerb) != noone;