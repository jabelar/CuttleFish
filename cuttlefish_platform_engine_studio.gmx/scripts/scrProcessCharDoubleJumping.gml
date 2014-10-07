if bounce then sprite_index = sprite_jumping_powered else sprite_index = sprite_jumping ;

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
        
// if at top of jump, start falling
if vert_speed >= 0 then state = FALLING ;
    
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

// process weapons if allowed
if ALLOW_PLAYER_WEAPON then
    {
    if kWeaponPressed then
        {
        scrProcessPlayerWeapon() ;
        }
    }
