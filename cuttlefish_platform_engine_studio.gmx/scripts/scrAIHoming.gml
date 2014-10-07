// This AI will try to home in on player, using normal movements, but if sight enabled then only
// if enemy has unobstructed view of player, otherwise it stands still

scrInitializeInputVariables() ;

if sight_enabled and (collision_line(x, y, objPlayer.x, objPlayer.y, objParentObstacle, false, true) or collision_line(x, y, objPlayer.x, objPlayer.y, objParentSlopeRight, false, true) or collision_line(x, y, objPlayer.x, objPlayer.y, objParentSlopeLeft, false, true) or collision_line(x, y, objPlayer.x, objPlayer.y, objParentPlatform, false, true)) then
    {
    // do nothing
    }
else
    {
    last_seen_x = objPlayer.x ;
    last_seen_y = objPlayer.y ;
    }
           
// the homing dead zone makes it so enemy doesn't wiggle when straight under char
// can't use dead zone vertically or won't exit top and bottom of ladders properly.
// since ladders are rare, prioritize vertical movement where possible
if last_seen_y < y then
    {
    scrProcessIsOver() ;
    if character_is_over = LADDER then 
        {
        if ladder_is_horizontal_bar then // can't move up, so try horizontally
            {
            if last_seen_x + HOMING_DEAD_ZONE < x then
                {
                kLeft = true ;
                kLeftPressed = true ;
                }
            else if last_seen_x - HOMING_DEAD_ZONE > x then 
                {
                kRight = true ;
                kRightPressed = true ;
                }
            }
        else // normal ladder so move up if not obstructed
            {
            if not place_meeting(x, y-1, objParentObstacle) then // player is above and can move up
                {
                kUp = true ;
                }
            else // obstructed so try horizontally
                {
                if last_seen_x + HOMING_DEAD_ZONE < x then
                    {
                    kLeft = true ;
                    kLeftPressed = true ;
                    }
                else if last_seen_x - HOMING_DEAD_ZONE > x then 
                    {
                    kRight = true ;
                    kRightPressed = true ;
                    }
                }
            }
        }
    else // no ladder to go up, so try horizontally and occasionally jump
        {
        if alarm[0] = 1 then kJumpPressed = true ;
        if last_seen_x + HOMING_DEAD_ZONE < x then
            {
            kLeft = true ;
            kLeftPressed = true ;
            }
        else if last_seen_x - HOMING_DEAD_ZONE > x then 
            {
            kRight = true ;
            kRightPressed = true ;
            }
        }
    }
else if last_seen_y > y 
    {
    if not place_meeting(x, y+1, objParentObstacle) then
        {
        scrProcessIsOver() ;
        scrProcessIsAbove() ;
        if (character_is_over = LADDER or character_is_above = LADDER) then // player is below and can move down
            {
            kDown = true ;
            }
        }
    else // either no vertical movement possibility        , left/right pressed needed to allow exit from ladder
        {
        if last_seen_x + HOMING_DEAD_ZONE < x then
            {
            kLeft = true ;
            kLeftPressed = true ;
            }
        else if last_seen_x - HOMING_DEAD_ZONE > x then 
            {
            kRight = true ;
            kRightPressed = true ;
            }
        }
    }
else // either no vertical movement possibility or lined up do horizontal movement, left/right pressed needed to allow exit from ladder
    {
    if last_seen_x + HOMING_DEAD_ZONE < x then
        {
        kLeft = true ;
        kLeftPressed = true ;
        }
    else if last_seen_x - HOMING_DEAD_ZONE > x then 
        {
        kRight = true ;
        kRightPressed = true ;
        }
    }
    
// but cancel any movement if it will cause overlap
// as long as not overlapping already (let them get unstuck)
if ALLOW_ENEMY_OVERLAP then
    {
    // do nothing
    }
else // prevent overlap
    {
    other_enemy_id = instance_place(x, y, objParentEnemy) ;
    if other_enemy_id < 0 then // not currently stuck
        {
        distance_to_check = ceil(abs(sprite_width) / 2) ;
        need_to_cancel = false ;
        if kRight then
            {
            if place_meeting(x+distance_to_check, y, objParentEnemy) then need_to_cancel = true ;
            }
        if kLeft then
            {
            if place_meeting(x-distance_to_check, y, objParentEnemy) then need_to_cancel = true ;
            }
        if kUp then
            {
            if place_meeting(x, y-distance_to_check, objParentEnemy) then need_to_cancel = true ;
            }
        if kDown then
            {
            if place_meeting(x, y+distance_to_check, objParentEnemy) then need_to_cancel = true ;
            }
        if need_to_cancel then
            {
            scrInitializeInputVariables() ;
            }
        }
    else // currently stuck
        {
        distance_to_check = abs(sprite_width)/2 ;
        need_to_cancel = false ;
        // give precedence to enemy already more in direction of movement
        if kRight then
            {
            if other_enemy_id.x > x then need_to_cancel = true ;
            }
        if kLeft then
            {
            if other_enemy_id.x < x then need_to_cancel = true ;
            }
        if kUp then
            {
            if other_enemy_id.y < y then need_to_cancel = true ;
            }
        if kDown then
            {
            if other_enemy_id.x > x then need_to_cancel = true ;
            }
        if need_to_cancel then
            {
            scrInitializeInputVariables() ;
            }
        }
    }


// also cancel any movement if in respawn safety period
if alarm[1] > 0 then // in safety period
    {
    scrInitializeInputVariables() ;
    }
    
// update kNone
kNone = false ;
if not kUp then
    {
    if not kDown then
        {
        if not kRight then
            {
            if not kLeft then
                {
                if not kJumpPressed then kNone = true ;
                }
            }
        }
    }
