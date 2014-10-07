sprite_index = sprite_climbing ;

vert_speed = 0 ;
scrProcessIsOver() ;
switch character_is_over
    {
    case NOTHING : // fell off or reached top
        {
        switch character_is_above
            {
            case NOTHING : // falling off
                {
                state = FALLING ;
                break ;
                }
            case SOLID :
                {
                state = STANDING ;
                break ;
                }
            case LADDER : // reached top
                {
                move_contact_all(270, CLIMB_SPEED * my_speed_factor) ;
                state = STANDING ;
                }
            case SLOPE_RIGHT :
                {
                state = STANDING ;
                break ;
                }
            case SLOPE_LEFT :
                {
                state = STANDING ;
                break ;
                }
            }
        break ;
        }
    case SOLID : // stuck
        {
        scrGetUnstuck() ;
        break ;
        }
    case LADDER : // still climbing
        {
        // center character on ladder, or hang properly from bar
        scrCenterOnLadder() ;        
        // process movement on ladder
        ladder_width = ladder_id.sprite_width ;
        if ladder_is_horizontal_bar then
            {
            if kUp then
                {
                // can't go up on horizontal bar unless also overlapping another ladder
                // find any other ladder
                original_ladder_id = ladder_id ;
                instance_deactivate_object(ladder_id) ;
                // snap to next ladder object, okay if another bar because will have same snap y
                scrCenterOnLadder() ;
                instance_activate_object(original_ladder_id) ;
                }
            if kDown then
                {
                scrProcessIsAbove() ;
                // probably always above LADDER if bar is more than one pixel thick or not at top of sprite, but might as well handle all cases
                switch character_is_above
                    {
                    case NOTHING : // exit ladder to falling
                        {
                        scrContactSolidDown(CLIMB_SPEED) ;
                        vert_speed = CLIMB_SPEED * my_speed_factor ;
                        state = FALLING ;
                        break ;
                        }
                    case SOLID : // exit ladder to standing
                        {
                        state = STANDING ;
                        break ;
                        }
                    case SLOPE_LEFT : // exit ladder to standing
                        {
                        state = STANDING ;
                        break ;
                        }
                    case SLOPE_RIGHT : // exit ladder to standing
                        {
                        state = STANDING ;
                        break ;
                        }
                    case LADDER : // drop off
                        {
                        // need to check if at bottom solid
                        if not place_meeting(x, y+1, objParentObstacle) then // still climbing 
                            {
                            scrContactSolidDown(CLIMB_SPEED * my_speed_factor) ;
                            state = FALLING ;
                            }
                        else // exit to standing on solid
                            {
                            state = STANDING ;
                            // break ;
                            } 
                        break ;
                        }
                    }
                }
            // left and right will exit and update facing direction
            if kLeft then 
                {
                if facing = RIGHT then // need to turn to left
                    {
                    facing = LEFT ;
                    switched_direction = true ;
                    }
                scrProcessIsRightOf() ;
                if character_is_right_of = LADDER then // allow ladder-to-ladder movement
                    {
                    scrContactSolidLeft(CLIMB_SPEED) ;
                    } 
                else if character_is_right_of = NOTHING then // move off of ladder
                    {
                    scrContactSolidLeft(ladder_width) ;
                    state = FALLING ;
                    }
                else // some sort of obstruction, don't move
                    {
                    // do nothing
                    }
                }
            if kRight then
                {
                if facing = LEFT then // need to turn to right
                    {
                    facing = RIGHT ;
                    switched_direction = true ;
                    }
                scrProcessIsLeftOf() ;
                if character_is_left_of = LADDER then // allow ladder-to-ladder movement
                    {
                    scrContactSolidRight(CLIMB_SPEED) ;
                    }
                else if character_is_left_of = NOTHING then // move off of ladder
                    {
                    scrContactSolidRight(ladder_width/my_speed_factor) ; // need to cancel out speed factor
                    state = FALLING ;
                    }
                else // some sort of obstruction, don't move
                    {
                    // do nothing
                    }                    
                }
            // cannot jump on bar so don't process kJumpPressed
            }
        else // ladder is normal ladder
            {
            if kUp then
                {
                if not place_meeting(x, y-CLIMB_SPEED * my_speed_factor, objParentObstacle) then move_outside_all(90, CLIMB_SPEED * my_speed_factor) ;
                }
            if kDown then
                {
                scrProcessIsAbove() ;
                switch character_is_above
                    {
                    case NOTHING : // exit ladder to falling
                        {
                        scrContactSolidDown(CLIMB_SPEED * my_speed_factor) ;
                        vert_speed = CLIMB_SPEED * my_speed_factor ;
                        state = FALLING ;
                        break ;
                        }
                    case SOLID : // exit ladder to standing
                        {
                        state = STANDING ;
                        break ;
                        }
                    case SLOPE_LEFT : // exit ladder to standing
                        {
                        state = STANDING ;
                        break ;
                        }
                    case SLOPE_RIGHT : // exit ladder to standing
                        {
                        state = STANDING ;
                        break ;
                        }
                    case LADDER : // keep climbing down
                        {
                        scrContactSolidDown(CLIMB_SPEED * my_speed_factor) ;
                        break ;
                        }
                    }
                }
            // left and right will exit and update facing direction
            if kLeft then 
                {
                if facing = RIGHT then // need to turn to left
                    {
                    facing = LEFT ;
                    switched_direction = true ;
                    }
                scrProcessIsRightOf() ;
                if character_is_right_of = LADDER then // allow ladder-to-ladder movement
                    {
                    state = WALKING ; // this avoids the auto-centering while on the ladder
                    } 
                else if character_is_right_of = NOTHING then // move off of ladder
                    {
                    if kLeftPressed then
                        {
                        scrContactSolidLeft(ladder_width/my_speed_factor) ; // need to cancel out speed factor
                        state = FALLING ;
                        }
                    }
                else // some sort of obstruction, don't move
                    {
                    // do nothing
                    }
                }
            if kRight then
                {
                if facing = LEFT then // need to turn to right
                    {
                    facing = RIGHT ;
                    switched_direction = true ;
                    }
                scrProcessIsLeftOf() ;
                if character_is_left_of = LADDER then // allow ladder-to-ladder movement
                    {
                    state = WALKING ; // this avoids the auto-centering while on the ladder
                    }
                else if character_is_left_of = NOTHING then // move off of ladder
                    {
                    if kRightPressed then
                        {
                        scrContactSolidRight(ladder_width/my_speed_factor) ; // need to cancel out speed factor
                        state = FALLING ;
                        }
                    }
                else // some sort of obstruction, don't move
                    {
                    // do nothing
                    }                    
                }
            // react to jump key pressed, exit ladder in direction faced unless blocked by solid
            if kJumpPressed then
                {
                scrJumpFromWalkable() ;
                sound_play(soundJump) ;
                state = JUMPING ;
                }
            }
        break ;
        }
    }

// process weapons if allowed
if ALLOW_PLAYER_WEAPON then
    {
    if kWeaponPressed then
        {
        scrProcessPlayerWeapon() ;
        }
    }

    
// process digging if allowed
if ALLOW_DIGGING then scrProcessDigging() ;
