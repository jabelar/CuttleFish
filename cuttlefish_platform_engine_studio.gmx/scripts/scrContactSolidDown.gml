// argument0 is the vertical speed, assumed to be positive
loop_size = round(argument0) ;
if loop_size <= 0 then break ;
repeat (loop_size)
    {
    scrProcessIsAbove() ;
    if character_is_above = SOLID then break ;
    y +=1 ;
    }

