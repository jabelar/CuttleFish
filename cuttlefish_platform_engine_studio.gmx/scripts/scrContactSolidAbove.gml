// argument0 is the vertical speed, expected to be negative (moving up)
loop_size = round(abs(argument0)) ;
repeat(loop_size)
    {
    scrProcessIsBelow() ;
    if character_is_below = SOLID then break ;
    y -= 1 ;
    }

