        // process user input controls
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
                    scrContactSolidSlopeLeft(WALK_SPEED) ;
                    // if obstructed change state to standing
                    if place_meeting(x-1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                case SOLID:
                    {
                    scrContactSolidSlopeLeft(WALK_SPEED) ;
                    // if obstructed change state to standing
                    if place_meeting(x-1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                case LADDER:
                    {
                    scrContactSolidSlopeLeft(WALK_SPEED) ;
                    // if obstructed change state to standing
                    if place_meeting(x-1, y-1, objParentObstacle) then state = STANDING ;
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
        if kRight then
            {
            if facing = LEFT then 
                {
                switch_direction = true ;
                if running_enabled then alarm[0] = run_delay ; // restart run timer
                }
            facing = RIGHT ;
            scrContactSolidRight(WALK_SPEED) ;
            scrContactSolidBelow() ;
            // if obstructed then change state to standing
            if place_meeting(x+1, y+1, objParentObstacle) then state = STANDING ;
            }
        if kNone then
            {
            state = STANDING ;
            }
