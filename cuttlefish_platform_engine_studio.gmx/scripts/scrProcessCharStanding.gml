// default variable settings for this state
sprite_index = sprite_standing ;
bounce = false ;

// process based on surroundings and user input controls
scrProcessIsAbove() ; // always update right before using as sometimes multiple moves within step
switch character_is_above
    {
    case SOLID:
        {
        // check if it is actually a slope
        if collision_line(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, objParentSlopeRight, true, true) then scrStandingOnSlopeRight()
        else if collision_line(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, objParentSlopeLeft, true, true) then scrStandingOnSlopeLeft()
        else scrStandingOnFlatWalkable() ;
        }
        break ;
    case LADDER: 
        {
        scrStandingAboveLadder() ;
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

