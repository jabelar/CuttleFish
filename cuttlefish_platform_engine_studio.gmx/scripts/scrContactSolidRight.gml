// argument 0 should be base speed for state (such as WALK_SPEED or RUN_SPEED)
loop_size = round(argument0 * my_speed_factor) ;
repeat (loop_size)
    {
    scrProcessIsLeftOf() ;
    if character_is_left_of = SOLID or character_is_left_of = SLOPE_RIGHT then break ;
    x += 1 ;
    }         
