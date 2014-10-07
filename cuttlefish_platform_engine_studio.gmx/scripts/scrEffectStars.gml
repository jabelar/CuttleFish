// creates three small stars randomly spaced around the location
// argument0 is x location
// argument1 is y location
// argument2 is number of stars
// argument3 is maximum distance from location
if not ALLOW_PARTICLE_EFFECTS then break ;
if fps < ROOM_SPEED * 0.8 then break ; // lagging so don't create more particles
repeat (argument2)
    {
    effect_create_above(ef_star, argument0+random(argument3), argument1+random(argument3), 0, c_yellow) ;
    }
