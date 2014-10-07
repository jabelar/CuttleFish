// process currents and winds 
// note cannot have this code in current objects as causes double counting when overlapping
// and if on currents in opposite directions, combine effect
// assumes currents are in the cardinal directions only
with (objParentCurrent)
    {
    if place_meeting(x, y, other.id) then
        {
        if current_direction = 0 then
            {
            with (other)
                {
                scrContactSolidRight(other.current_speed/my_speed_factor) ; // negate speed factor as it does not apply to currents
                }
            break ; // exit after finding one in this direction
            }
        }
    }
with (objParentCurrent)
    {
    if place_meeting(x, y, other.id) then
        {
        if current_direction = 90 then
            {
            with (other)
                {
                scrContactSolidAbove(other.current_speed/my_speed_factor) ; // negate speed factor as it does not apply to currents
                }
            break ; // exit after finding one in this direction
            }
        }
    }
with (objParentCurrent)
    {
    if place_meeting(x, y, other.id) then
        {
        if current_direction = 180 then
            {
            with (other)
                {
                scrContactSolidLeft(other.current_speed/my_speed_factor) ; // negate speed factor as it does not apply to currents
                }
            break ; // exit after finding one in this direction
            }
        }
    }
with (objParentCurrent)
    {
    if place_meeting(x, y, other.id) then
        {
        if current_direction = 270 then
            {
            with (other)
                {
                scrContactSolidDown(other.current_speed/my_speed_factor) ; // negate speed factor as it does not apply to currents
                }
            break ; // exit after finding one in this direction
            }
        }
    }
