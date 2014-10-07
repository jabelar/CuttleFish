if bounce then sprite_index = sprite_jumping_powered else sprite_index = sprite_falling ;

// move to contact in falling direction
scrContactSolidDown(abs(vert_speed)) ; // vert_speed should be positive, but best to be safe

// handle case of ladders which are not solids
if place_meeting(x, y, objParentLadder) then // fell onto ladder, but may also be horizontal bar
    {
    if instance_place(x, y, objParentBar) = noone then // normal ladder
        {
        move_outside_all(90, abs(vert_speed)) ; // note this can be refined to handle case where might be other non-solid on top of ladder
        }
    else // it is horizontal bar
        {
        // do nothing special, keep falling
        }
    }
    
// if movable obstacle, check for crushing things like player, companion, enemies
// only squash if movable falling on top, 
// otherwise causes trouble with stacks on vert platforms
if object_is_ancestor(id.object_index, objParentMovableObstacle) and (other.y - other.yprevious > 0) then
    {
    // process possible squashed objects
    with (objPlayer)
        {
        if place_meeting(x, y, other.id) and state != DYING then// hit by movable and not already dying
            {
            scrKillPlayer() ;
            }
        }
    with (objParentEnemy)
        {
        if place_meeting(x, y, other.id) and state != DYING then// hit by movable and not already dying
            {
            // set dying sprite to squashable version if available
            if squashable then sprite_dying = sprite_squashable ;
            scrKillEnemy() ;
            }
        }
    with (objParentCompanion)
        {
        if place_meeting(x, y, other.id) and state != DYING then// hit by movable and not already dying
            {
            scrKillCompanion() ;
            }
        }
    }

// if falling obstacle, check for crushing things like player, companion, enemies
// only squash if falling on top, 
// otherwise causes trouble with stacks on vert platforms
if object_is_ancestor(id.object_index, objParentFallingObstacle) and (other.y - other.yprevious > 0) then
    {
    // process possible squashed objects
    with (objPlayer)
        {
        if place_meeting(x, y, other.id) and state != DYING then// hit by movable and not already dying
            {
            scrKillPlayer() ;
            }
        }
    with (objParentEnemy)
        {
        if place_meeting(x, y, other.id) and state != DYING then// hit by movable and not already dying
            {
            // set dying sprite to squashable version if available
            if squashable then sprite_dying = sprite_squashable ;
            scrKillEnemy() ;
            }
        }
    with (objParentCompanion)
        {
        if place_meeting(x, y, other.id) and state != DYING then// hit by movable and not already dying
            {
            scrKillCompanion() ;
            }
        }
    }

// check for bouncing or landing on walkables
scrProcessIsAbove() ;
switch character_is_above
    {
    case NOTHING:
        {
        // free to fall, so do nothing
        break ;
        }
    case LADDER:
        {
        // check if it is actually a horizontal bar, which you can't land on
        if instance_place(x, y+1, objParentBar) = noone then // regular ladder so land
            {
            // super bounce if powered and space to do so
            if bounce and place_free(x, y + INITIAL_SUPER_JUMP) then
                {
                vert_speed = INITIAL_SUPER_JUMP;
                state = SUPER_JUMPING ;
                bounce = false ;
                }
            else // land on
                {
                state = STANDING ;
                }
            }
        else // horizontal bar so don't land, but grab for climbing if already overlapping it
            {
            if instance_place(x, y, objParentBar) then state = CLIMBING ;
            }
        break ;
        }
    default:
        {
        // super bounce if powered and space to do so
        if not bounce then // land on
            {
            state = STANDING ;
            }
        else
            {
            scrProcessIsBelow() ;
            if character_is_below = NOTHING or character_is_below = LADDER then
                {
                vert_speed = INITIAL_SUPER_JUMP;
                state = SUPER_JUMPING ;
                bounce = false ;
                }
            }
        break ;
        }
    }

// process user input controls
// if allowed to move left and right while jumping
if ALLOW_MOVE_WHILE_JUMP then
    {
    scrMoveInAir() ;
    }
            
// create bounce if allowed and press jump during jump
if ALLOW_SUPER_BOUNCE and kJumpPressed then
    {
    bounce = true ;
    } 
       
// check for double jump, if allowed
if ALLOW_DOUBLE_JUMP and kJumpPressed then
    {
    // check if just started falling
    if vert_speed <= DOUBLE_JUMP_ZONE then // not falling too fast yet
        {
        vert_speed = vert_speed + INITIAL_DOUBLE_JUMP ;
        state = DOUBLE_JUMPING ;
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
