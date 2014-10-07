// default variable settings for this state
sprite_index = sprite_walking ;
bounce = false ;

// process based on surroundings and user input controls
scrProcessIsAbove() ;
switch character_is_above
    {
    case SOLID:
        {
        // check if it is actually a slope
        if collision_line(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, objParentSlopeRight, true, true) then scrWalkingOnSlopeRight()
        else if collision_line(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, objParentSlopeLeft, true, true) then scrWalkingOnSlopeLeft()
        else scrWalkingOnFlatWalkableDumb() ;
        }
        break ;
    case LADDER: 
        {
        scrWalkingAboveLadder() ;
        }
        break ;
    case SLOPE_RIGHT:
        {
        scrWalkingOnSlopeRightDumb() ;
        }
        break ;
    case SLOPE_LEFT:
        {
        scrWalkingOnSlopeLeftDumb() ;
        }
        break ;
    case NOTHING:  // should fall
        {
        state = FALLING ;
        }
        break ;
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

