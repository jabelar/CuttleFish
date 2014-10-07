        // process user input controls
        if kRight then
            {
            if facing = LEFT then 
                {
                switch_direction = true ;
                state = WALKING ; // slow down if change direction while walking
                }
            facing = RIGHT ;
            scrProcessIsLeftOf() ;
            switch character_is_left_of
                {
                case NOTHING: 
                    {
                    scrContactSolidSlopeRight(RUN_SPEED) ;
                    // if obstructed change state to standing
                    if place_meeting(x+1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                case SOLID: 
                    {
                    scrContactSolidSlopeRight(RUN_SPEED) ;
                    // if obstructed change state to standing
                    if  place_meeting(x+1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                case LADDER:
                    {
                    scrContactSolidSlopeRight(RUN_SPEED) ;
                    // if obstructed change state to standing
                    if  place_meeting(x+1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                case SLOPE_RIGHT:
                    {
                    scrContactSolidSlopeRight(RUN_SPEED) ;
                    // if obstructed change state to standing
                    if  place_meeting(x+1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                }
            }
        if kLeft then
            {
            if facing = RIGHT then 
                {
                switch_direction = true ;
                state = WALKING ; // slow down if change direction while walking
                }
            facing = LEFT ;
            scrContactSolidLeft(RUN_SPEED) ;
            scrContactSolidBelow() ;
            // if obstructed then change state to standing
            if place_meeting(x-1, y+1, objParentObstacle) then state = STANDING ;
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
