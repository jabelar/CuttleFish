// process conveyor belts
// note cannot have this code in conveyors as causes double counting when spanning
// but if on conveyors in opposite directions, combine effect
if conveyor_id.convey_direction = 0 then // moving right
    {
    scrContactSolidRight(conveyor_id.convey_speed/my_speed_factor) ; // need to negate speed factor, since that doesn't apply on conveyors
    }
else // moving left
    {
    scrContactSolidLeft(conveyor_id.convey_speed/my_speed_factor) ;
    }
