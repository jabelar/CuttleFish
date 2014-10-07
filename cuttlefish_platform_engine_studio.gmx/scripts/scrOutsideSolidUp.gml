// argument0 is the vertical distance meant to be positive to represent up
loop_size = round(argument0) ;
repeat(loop_size)
    {
    scrProcessIsOver() ;
    if not character_is_over = SOLID then break ;
    y -= 1 ;
    }

