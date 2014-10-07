        // process user input controls
        if kLeft then
            {
            if facing = RIGHT then switch_direction = true ;
            facing = LEFT ;
            scrProcessIsRightOf() ;
            switch character_is_right_of
                {
                case NOTHING:
                    {
                    state = WALKING ;
                    scrContactSolidSlopeLeft(WALK_SPEED) ;
                    break ;
                    }
                case SOLID:
                    {
                    // do nothing, remain standing
                    break ;
                    }
                case LADDER:
                    {
                    scrContactSolidSlopeLeft(WALK_SPEED) ;
                    state = CLIMBING ;
                    break ;
                    }
                case SLOPE_LEFT:
                    {
                    state = WALKING ;
                    scrContactSolidSlopeLeft(WALK_SPEED) ;
                    break ;
                    }
                }
            }
        if kRight then
            {
            if facing = LEFT then switch_direction = true ;
            facing = RIGHT ;
            state = WALKING ;
            scrContactSolidRight(WALK_SPEED) ;
            scrContactSolidBelow() ;
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
