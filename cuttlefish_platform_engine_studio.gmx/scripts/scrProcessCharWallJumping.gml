sprite_index = sprite_wall_jumping ;

if kJump then 
    {
    // have to jump away in opposite direction as landed (this avoids scooting up the wall)
    if wall_jump_exit_direction = RIGHT then
        {
        if kRight then scrJumpFromWalkable() ;
        }
    else // must be left
        {
        if kLeft then scrJumpFromWalkable() ;
        }
    }

// check if time to fall
if alarm[2] <=0 then state = FALLING ;

// no weapons allowed while wall jumping
