// default variable settings for this state
sprite_index = sprite_running ;
bounce = false ;

// process based on surroundings and user input controls
scrProcessIsAbove() ;
switch character_is_above
    {
    case SOLID:
        {
        // check if it is actually a slope
        if collision_line(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, objParentSlopeRight, true, true) then scrRunningOnSlopeRight()
        else if collision_line(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, objParentSlopeLeft, true, true) then scrRunningOnSlopeLeft()
        else scrRunningOnFlatWalkable() ;
        }
        break ;
    case LADDER: 
        {
        scrRunningAboveLadder() ;
        }
        break ;
    case SLOPE_RIGHT:
        {
        scrRunningOnSlopeRight() ;
        }
        break ;
    case SLOPE_LEFT:
        {
        scrRunningOnSlopeLeft() ;
        }
        break ;
    case NOTHING:  // should fall
        {
        state = FALLING ;
        }
        break ;
    }

// if switched direction while running, go back to walking
if switched_direction and state = RUNNING then
    {
    state = WALKING ;
    alarm[0] = run_delay ;
    }

// process weapons if allowed
if ALLOW_PLAYER_WEAPON then
    {
    if kWeaponPressed then
        {
        scrProcessPlayerWeapon() ;
        }
    }

