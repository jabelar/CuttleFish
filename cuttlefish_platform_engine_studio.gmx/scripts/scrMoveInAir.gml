// process any wind currents
scrProcessCurrent() ;     

// check for grabbing onto ladder
scrProcessIsOver() ;
if character_is_over = LADDER then
    {
    if kDown or kUp then state = CLIMBING ;
    }

// process horizontal movement
if kRight then
    {
    if facing = LEFT then switch_direction = true ;
    facing = RIGHT ;
    scrContactSolidRight(WALK_SPEED) ;
    // check for opportunity to wall jump
    if ALLOW_WALL_JUMP then
        {
        if object_index = objPlayer then
            {
            scrProcessIsLeftOf() ;
            if character_is_left_of = SOLID then
                {
                if state != FALLING then
                    {
                    // only wall jump near top of jump, otherwise it is annoying
                    if abs(vert_speed) < WALL_JUMP_ZONE then // near top of jump
                        {
                        alarm[2] = WALL_JUMP_DELAY * ROOM_SPEED ;
                        wall_jump_exit_direction = LEFT ;
                        state = WALL_JUMPING ;
                        }
                    }
                }
            }
        }
    }     
if kLeft then
    {
    if facing = RIGHT then switch_direction = true ;
    facing = LEFT ;
    scrContactSolidLeft(WALK_SPEED) ;
    // check for opportunity to wall jump
    if ALLOW_WALL_JUMP then
        {
        if object_index = objPlayer then
            {
            scrProcessIsRightOf() ;
            if character_is_right_of = SOLID then
                {
                if state != FALLING then
                    {
                    // only wall jump near top of jump, otherwise it is annoying
                    if abs(vert_speed) < WALL_JUMP_ZONE then // near top of jump
                        {
                        alarm[2] = WALL_JUMP_DELAY * ROOM_SPEED ;
                        wall_jump_exit_direction = RIGHT ;
                        state = WALL_JUMPING ;
                        }
                    }
                }
            }
        }
    }
    
// process parachute if allowed and in appropriate state
parachute_deployed = false ;
if allow_parachute then 
    {
    if state = FALLING then
        {
        if kUp then parachute_deployed = true ;
        }
    }
    
