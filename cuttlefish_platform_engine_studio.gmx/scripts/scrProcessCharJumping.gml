if bounce then sprite_index = sprite_jumping_powered else sprite_index = sprite_jumping ;

// move to contact in jumping direction
if vert_speed !=0 then 
    {
    scrContactSolidAbove(vert_speed) ;
    }

// process extended jumping if allowed
if ALLOW_EXTENDED_JUMP then 
    {
    if kJump then my_gravity_factor = my_original_gravity_factor * 0.5 else my_gravity_factor = my_original_gravity_factor ;
    }

// check for hitting head on solids
if place_meeting(x, y-1, objParentObstacle) then // might have bumped head
    {
    if not place_meeting(x, y-1, objParentJumpThroughObstacle) then
        {
        if not place_meeting(x, y-1, objParentJumpThroughPlatform) then
            {
            if not place_meeting(x, y-1, objParentJumpThroughSlopeRight) then
                {
                if not place_meeting(x, y-1, objParentJumpThroughSlopeLeft) then
                    {
                    vert_speed = 0 ;
                    STATE = FALLING ;
                    }
                }
            }
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

// check for double jump, if allowed
if ALLOW_DOUBLE_JUMP and kJumpPressed then
    {
    // check if near top
    if vert_speed >= -DOUBLE_JUMP_ZONE then // nearing top
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
