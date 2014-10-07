// argument 0 should be base speed for state (such as WALK_SPEED or RUN_SPEED)
// need to tolerate any roughness, such as caused by the transparency pixel in sprite
// now move to contact at 45 degrees
loop_size = round(argument0 * my_speed_factor * 0.71) ; // 0.71 factor makes 45 diagonal speed correct
repeat (loop_size)
    {
    scrContactSolidLeft(1) ;
    scrContactSolidDown(1) ;
    }

// handle case where went over top
// adjust down unless now on ladder
scrProcessIsOver() ;
if character_is_over != LADDER then scrContactSolidBelow() ;
