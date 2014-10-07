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
        scrContactSolidDown(FALL_SPEED * my_speed_factor) ;
        state = STANDING ;
        }
    }
if kUp then // start climbing if ladder
    {
    scrProcessIsOver() ;
    if character_is_over = LADDER then state = CLIMBING ;
    }

if kRight then
    {
    if facing = LEFT then 
        {
        switch_direction = true ;
        if running_enabled then alarm[0] = run_delay ; // restart run timer
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
            // if obstructed change state to standing
            if place_meeting(x+1, y-1, objParentObstacle) then state = STANDING ;
            }
            break ;
        }
    }
if kLeft then
    {
    if facing = RIGHT then 
        {
        switch_direction = true ;
        if running_enabled then alarm[0] = run_delay ; // restart run timer
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
        case SLOPE_LEFT:
            {
            scrContactSolidSlopeLeft(WALK_SPEED) ;
            // if obstructed change state to standing
            if place_meeting(x-1, y-1, objParentObstacle) then state = STANDING ;
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
