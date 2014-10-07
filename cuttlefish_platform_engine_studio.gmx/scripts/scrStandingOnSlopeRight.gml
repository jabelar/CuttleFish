        // process user input controls
        if kRight then
            {
            if facing = LEFT then switch_direction = true ;
            facing = RIGHT ;
            scrProcessIsLeftOf() ;
            switch character_is_left_of
                {
                case NOTHING: // maybe reaching top slope, need to look further
                    {
                    state = WALKING ;
                    scrContactSolidSlopeRight(WALK_SPEED) ;
                    }
                    break ;
                case SOLID:
                    {
                    // do nothing, remain standing
                    }
                    break ;
                case LADDER:
                    {
                    state = WALKING ;
                    scrContactSolidSlopeRight(WALK_SPEED) ;
                    }
                    break ;
                case SLOPE_RIGHT:
                    {
                    state = WALKING ;
                    scrContactSolidSlopeRight(WALK_SPEED) ;
                    }
                    break ;
                }
            }
        if kLeft then
            {
            if facing = RIGHT then switch_direction = true ;
            facing = LEFT ;
            state = WALKING ;
            scrContactSolidLeft(WALK_SPEED) ;
            scrContactSolidBelow() ;
            }
        if kJumpPressed then
            {
            scrJumpFromWalkable() ;
            }
        if kUp then // start climbing if ladder
            {
            scrProcessIsOver() ;
            if character_is_over = LADDER then state = CLIMBING ;
            }
        if kWeaponPressed then
            {
            // do nothing here, processed in step script
            }
        if kDown then 
            {
            if self.object_index = objPlayer then state = DUCKING ;
            }
        if kNone then
            {
            state = STANDING ;
            }


