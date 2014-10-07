// ensure sitting flush on ground
scrContactSolidBelow() ;

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
                    scrContactSolidRight(RUN_SPEED) ;
                    }
                    break ;
                case SOLID:
                    {
                    state = STANDING ;
                    }
                    break ;
                case LADDER:
                    {
                    scrContactSolidRight(RUN_SPEED) ;
                    }
                    break ;
                case SLOPE_RIGHT:
                    {
                    scrContactSolidSlopeRight(RUN_SPEED) ;
                    // if obstructed change to state standing
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
                state = WALKING ; // slow down if change direction while walking
                }
            facing = LEFT ;
            scrProcessIsRightOf() ;
            switch character_is_right_of
                {
                case NOTHING:
                    {
                    scrContactSolidLeft(RUN_SPEED) ;
                    }
                    break ;
                case SOLID:
                    {
                    state = STANDING ;
                    }
                    break ;
                case LADDER:
                    {
                    scrContactSolidLeft(RUN_SPEED) ;
                    }
                    break ;
                case SLOPE_LEFT:
                    {
                    scrContactSolidSlopeLeft(RUN_SPEED) ;
                    if place_meeting(x-1, y-1, objParentObstacle) then state = STANDING ;
                    }
                    break ;
                }
            }
        if kJumpPressed then
            {
            scrJumpFromWalkable() ;
            sound_play(soundJump) ;
            }
        if kWeaponPressed then
            {
            // do nothing here, processed in step script
            }
        if kDown then 
            {
            if self.object_index = objPlayer then 
                {
                state = DUCKING ;
                }
            else // check further that kDown only is pressed
                {
                if not kRight and not kLeft and not kUp then
                    {
                    state = STANDING ;
                    }
                }
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
