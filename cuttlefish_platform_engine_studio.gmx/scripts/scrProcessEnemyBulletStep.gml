// bullets may move fast, so need to use collision line method for determining collisions
if facing = LEFT then horiz_speed = - ENEMY_BULLET_SPEED else horiz_speed = ENEMY_BULLET_SPEED ;

// check for collisions with player
player_id = collision_line(x, y, x + horiz_speed, y, objPlayer, false, true) ; // check for char in bullet's path
if player_id > 0 then // player hit
    {
    if player_id.state != DYING then // don't count hits on player already dying
        {
        if not player_id.shield_deployed then // also ignore if shielded
            {
            with (player_id) { scrKillPlayer() ; }
            }
        instance_destroy() ;
        }
    }
    
// check for collisions with companion
companion_id = collision_line(x, y, x + horiz_speed, y, objParentCompanion, false, true) ; // check for char in bullet's path
if companion_id > 0 then // companion hit
    {
    if companion_id.state != DYING then // don't count hits on player already dying
        {
        if not companion_id.shield_deployed then // also ignore if shielded
            {
            with (companion_id) { scrKillCompanion() ; }
            }
        instance_destroy() ;
        }
    }

// check for collisions with obstacles
obstacle_id = collision_line(x, y, x + horiz_speed, y, objParentObstacle, false, true) ; // check for obstacle in bullet's path
if obstacle_id > 0 then // obstacle hit
    {
    instance_destroy() ;
    }

// check for collisions with breakables, if allowed
if ALLOW_ENEMY_WEAPON_BREAK_BREAKABLES then
    {
    obstacle_id = collision_line(x, y, x + horiz_speed, y, objParentBreakableObstacle, false, true) ; // check for enemy in bullet's path
    if obstacle_id > 0 and ALLOW_PLAYER_WEAPON_BREAK_BREAKABLES then // obstacle hit and allowed to break
        {
        with (obstacle_id)
            {
            scrBreakBreakable() ;
            }
        instance_destroy() ; // destroy bullet after it hits something
        }
    }
    
// check for outside room
if x < 0 or y < 0 or x > room_width or y > room_height then
    {
    instance_destroy() ;
    }

// update position
x = x + horiz_speed ;
