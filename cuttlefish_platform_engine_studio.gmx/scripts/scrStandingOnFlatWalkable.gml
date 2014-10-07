// ensure sitting flush on ground
scrContactSolidBelow() ;

        // process user input controls
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
                    // do nothing, stay standing
                    break ;
                    }
                case LADDER:
                    {
                    state = WALKING ;
                    scrContactSolidRight(WALK_SPEED) ; 
                    break ;
                    }
                case SLOPE_RIGHT:
                    {
                    state = WALKING ;
                    scrContactSolidSlopeRight(WALK_SPEED) ;
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
                    // do nothing, remain standing
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
                    state = WALKING ;
                    scrContactSolidSlopeLeft(WALK_SPEED) ;
                    break ;
                    }
                }
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

