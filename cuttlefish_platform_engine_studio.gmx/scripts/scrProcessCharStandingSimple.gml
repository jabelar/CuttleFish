// default variable settings for this state
sprite_index = sprite_standing ;
bounce = false ;

// process based on surroundings and user input controls
scrProcessIsAbove() ; // always update right before using as sometimes multiple moves within step
switch character_is_above
    {
    case SOLID:
        {
        // ensure sitting flush on ground
        scrContactSolidBelow() ;
        }
        break ;
    case LADDER: 
        {
        // check if actually a horizontal bar
        if instance_place(x,y+1, objParentBar) > 0 then state = FALLING ;
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

