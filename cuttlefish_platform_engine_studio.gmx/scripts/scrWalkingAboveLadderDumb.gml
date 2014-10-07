// process user input controls

// check if it is actually a horizontal bar
if instance_place(x,y+1, objParentBar) = noone then // regular ladder
    {

if kRight then
    {
    if facing = LEFT then 
        {
        switch_direction = true ;
        }
    facing = RIGHT ;
    scrProcessIsLeftOf() ;
    switch character_is_left_of
        {
        case NOTHING:
            {
            scrContactSolidRight(WALK_SPEED) ; 
            }
            break ;
        case SOLID:
            {
            state = STANDING ;
            }
            break ;
         case LADDER:
            {
            scrContactSolidRight(WALK_SPEED) ; 
            }
            break ;
        case SLOPE_RIGHT:
            {
            scrContactSolidSlopeRight(WALK_SPEED) ;
            }
            break ;
        case SLOPE_LEFT:
            {
            scrContactSolidRight(WALK_SPEED) ; 
            }
            break ;
        }
    }
if kLeft then
    {
    if facing = RIGHT then 
        {
        switch_direction = true ;
        }
    facing = LEFT ;
    scrProcessIsRightOf() ;
    switch character_is_right_of
        {
        case NOTHING:
            {
            scrContactSolidLeft(WALK_SPEED) ;
            }
            break ;
        case SOLID:
            {
            state = STANDING ;
            }
            break ;
        case LADDER:
            {
            scrContactSolidLeft(WALK_SPEED) ;
            }
            break ;
        case SLOPE_RIGHT:
            {
            scrContactSolidLeft(WALK_SPEED) ;
            }
            break ;
        case SLOPE_LEFT:
            {
            scrContactSolidSlopeLeft(WALK_SPEED) ;
            }
            break ;
        }
    }
    }
else // actually horizontal bar, which you should be able to stand on
    {
    state = FALLING ;
    }
