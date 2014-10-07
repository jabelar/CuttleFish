// argument 0 should be base speed for state (such as WALK_SPEED or RUN_SPEED)
// need to tolerate any roughness, such as caused by the transparency pixel in sprite
scrContactSolidAbove(2) ;
// now move to contact at 45 degrees
loop_size = round(argument0 * my_speed_factor * 0.71) ; // 0.71 factor makes 45 diagonal speed correct
repeat (loop_size)
    {
    scrProcessIsBelow() ;
    if character_is_below = SOLID then break ;
    y -= 1 ;
    scrProcessIsLeftOf() ;
    if character_is_left_of = SOLID then break ;
    x += 1
    }

// handle case where went over top
// adjust down unless now on ladder
scrProcessIsOver() ;
if character_is_over != LADDER then scrContactSolidBelow() ;
