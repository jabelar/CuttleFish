// process user input controls

// check if it is actually a horizontal bar
if instance_place(x,y+1, objParentBar) = noone then // regular ladder
    {
    // might be running past it or might choose to climb up/down
    if kDown then
        {
        // need to check whether at bottom
        if not place_meeting(x, y+1, objParentObstacle) then // ladder continues
            {
            scrContactSolidDown(CLIMB_SPEED * my_speed_factor) ;
            scrCenterOnLadder() ;  
            state = CLIMBING ;
            }
        else // not really ladder, rather solid at bottom of ladder
            {
            scrContactSolidDown(CLIMB_SPEED * my_speed_factor) ;
            }
        }
    if kUp then // start climbing if ladder
        {
        scrProcessIsOver() ;
        if character_is_over = LADDER then state = CLIMBING ;
        }
    if kRight then
        {
        if facing = LEFT then switched_direction = true ; // need for cleaning up contact to adjacent obstacles
        facing = RIGHT ;
        scrProcessIsLeftOf() ;
        switch character_is_left_of
            {
            case NOTHING:
                {
                state = WALKING ;
                scrContactSolidRight(WALK_SPEED) ; 
                break ;
                }
            case SOLID:
                {
                // do nothing
                }
                break ;
            case LADDER:
                {
                state = WALKING ;
                scrContactSolidRight(WALK_SPEED) ; 
                break ;
                }
            case SLOPE_RIGHT:
                {
                scrContactSolidSlopeRight(WALK_SPEED) ;
                // if not obstructed change state to walking
                if not place_meeting(x+1, y-1, objParentObstacle) then state = WALKING ;
                break ;
                }
            }
        }
    if kLeft then
        {
        if facing = RIGHT then switched_direction = true ; // need for cleaning up contact to adjacent obstacles
        facing = LEFT ;
        scrProcessIsRightOf() ;
        switch character_is_right_of
            {
            case NOTHING:
                {
                state = WALKING ;
                scrContactSolidLeft(WALK_SPEED) ;
                break ;
                }
            case SOLID:
                {
                // do nothing
                break ;
                }
            case LADDER:
                {
                state = WALKING ;
                scrContactSolidLeft(WALK_SPEED) ;
                break ;
                }
            case SLOPE_LEFT:
                {
                scrContactSolidSlopeLeft(WALK_SPEED) ;
                // if not obstructed change state to walking
                if not place_meeting(x-1, y-1, objParentObstacle) then state = WALKING ;
                }
                break ;
            }
        }
    if kJumpPressed then
        {
        scrJumpFromWalkable() ;
        }
    if kWeaponPressed then
        {
        // do nothing here, weapons processed in step script
        }
    }
else // actually horizontal bar, which you should be able to stand on
    {
    state = FALLING ;
    }
