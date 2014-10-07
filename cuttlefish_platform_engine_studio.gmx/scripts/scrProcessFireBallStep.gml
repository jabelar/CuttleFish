// AI instead of user input into the state machine
scrProcessEnemyAI() ;

// now process state transitions and physics
scrProcessStatePhysics() ;

// update sprite direction
scrUpdateSpriteDirection() ;

// check for collisions with player
player_id = instance_place(x, y, objPlayer) ;
if player_id > 0 then // player hit
    {
    if player_id.state != DYING then // don't count hits on player already dying
        {
        if not player_id.shield_deployed or alarm[4] > 0 then // also ignore if shielded or initial grace period not expired
            {
            with (player_id) { scrKillPlayer() ; }
            }
        }
    }
    
// check for collisions with companion
companion_id = instance_place(x, y, objParentCompanion) ;
if companion_id > 0 then // companion hit
    {
    if companion_id.state != DYING then // don't count hits on player already dying
        {
        if not companion_id.shield_deployed then // also ignore if shielded
            {
            with (companion_id) { scrKillCompanion() ; }
            }
        }
    }
    
// check for collisions with breakables, if allowed
if ALLOW_ENEMY_WEAPON_BREAK_BREAKABLES then
    {
    if facing = LEFT then
        {
        obstacle_id = instance_place(x-1, y, objParentBreakableObstacle) ;
        }
    else // facing right
        {
        obstacle_id = instance_place(x+1, y, objParentBreakableObstacle) ;
        }
    if obstacle_id > 0 then // obstacle hit
        {
        with (obstacle_id)
            {
            scrBreakBreakable() ;
            }
        }
    }
    
// check for outside room
if x < 0 or y < 0 or x > room_width or y > room_height then
    {
    instance_destroy() ;
    }

