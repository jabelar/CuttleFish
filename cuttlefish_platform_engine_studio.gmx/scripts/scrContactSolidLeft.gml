// argument 0 should be base speed for state (such as WALK_SPEED or RUN_SPEED)
loop_size = round(argument0 * my_speed_factor) ;
repeat (loop_size)
    {
    scrProcessIsRightOf() ;
    if character_is_right_of = SOLID or character_is_right_of = SLOPE_LEFT then break ;
    x -= 1 ;
    }         
