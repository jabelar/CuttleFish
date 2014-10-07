        // process user input controls
        if kLeft then
            {
            if facing = RIGHT then 
                {
                switch_direction = true ;
                state = WALKING ; // slow down if change direction while walking
                }
            facing = LEFT ;
            scrProcessIsRightOf() ;
            switch character_is_right_of
                {
                case NOTHING:
                    {
                    scrContactSolidSlopeLeft(RUN_SPEED) ;
                    // if obstructed change state to standing
                    if place_meeting(x-1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                case SOLID: // maybe reaching top of slope, need to look further
                    {
                    scrContactSolidSlopeLeft(RUN_SPEED) ;
                    // if obstructed change state to standing
                    if place_meeting(x-1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                case LADDER:
                    {
                    scrContactSolidSlopeLeft(RUN_SPEED) ;
                    // if obstructed change state to standing
                    if place_meeting(x-1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                case SLOPE_LEFT:
                    {
                    scrContactSolidSlopeLeft(RUN_SPEED) ;
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
                state = WALKING ; // slow down if change direction while walking
                }
            facing = RIGHT ;
            scrContactSolidRight(RUN_SPEED) ;
            scrContactSolidBelow() ;
            // if obstructed then change state to standing
            if place_meeting(x+1, y+1, objParentObstacle) then state = STANDING ;
            }
        if kJumpPressed then
            {
            scrJumpFromWalkable() ;
            }
        if kWeaponPressed then
            {
            // do nothing here, processed in step script
            }
        if kDown then 
            {
            if self.object_index = objPlayer then state = DUCKING ;
            }
        if kUp then // start climbing if ladder
            {
            scrProcessIsOver() ;
            if character_is_over = LADDER then state = CLIMBING ;
            }
        if kNone then
            {
            state = STANDING ;
            }
