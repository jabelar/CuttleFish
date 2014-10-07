// ensure sitting flush on ground
scrContactSolidBelow() ;

        // process user input controls
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
                    scrContactSolidSlopeRight(WALK_SPEED) ;
                    // if obstructed change state to standing
                    if place_meeting(x+1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                case SOLID: 
                    {
                    scrContactSolidSlopeRight(WALK_SPEED) ;
                    // if obstructed change state to standing
                    if place_meeting(x+1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                case LADDER:
                    {
                    scrContactSolidSlopeRight(WALK_SPEED) ;
                    // if obstructed change state to standing
                    if place_meeting(x+1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                case SLOPE_RIGHT:
                    {
                    scrContactSolidSlopeRight(WALK_SPEED) ;
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
            scrContactSolidLeft(WALK_SPEED) ;
            scrContactSolidBelow() ;
            // if obstructed then change state to standing
            if place_meeting(x-1, y+1, objParentObstacle) then state = STANDING ;
            }
        if kNone then
            {
            state = STANDING ;
            }
