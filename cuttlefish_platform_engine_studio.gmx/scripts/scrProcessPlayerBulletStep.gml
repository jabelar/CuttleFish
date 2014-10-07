// bullets may move fast, so need to use collision line method for determining collisions
if facing = LEFT then horiz_speed = - PLAYER_BULLET_SPEED else horiz_speed = PLAYER_BULLET_SPEED ;

// check for collisions with enemies
enemy_id = collision_line(x, y, x + horiz_speed, y, objParentEnemy, false, true) ; // check for enemy in bullet's path
if enemy_id > 0 then // enemy hit
    {
    if enemy_id.state != DYING then // don't count hits on enemies already dying
        {
        with (enemy_id)
            {
            scrKillEnemy() ;
            }
        instance_destroy() ; // destroy bullet after it hits something
        }
    }
    
// check for collisions with turrets
obstacle_id = collision_line(x, y, x + horiz_speed, y, objParentTurret, false, true) ; // check for enemy in bullet's path
if obstacle_id > 0 and ALLOW_PLAYER_WEAPON_KILL_TURRETS then // obstacle hit and allowed to kill
    {
    with (obstacle_id)
        {
        scrKillTurret() ;
        }
    instance_destroy() ; // destroy bullet after it hits something
    }
    
// check for collisions with breakables
obstacle_id = collision_line(x, y, x + horiz_speed, y, objParentBreakableObstacle, false, true) ; // check for enemy in bullet's path
if obstacle_id > 0 and ALLOW_PLAYER_WEAPON_BREAK_BREAKABLES then // obstacle hit and allowed to break
    {
    with (obstacle_id)
        {
        scrBreakBreakable() ;
        }
    instance_destroy() ; // destroy bullet after it hits something
    }
    
// check for collisions with obstacles
obstacle_id = collision_line(x, y, x + horiz_speed, y, objParentObstacle, true, true) ; // check for enemy in bullet's path, use precise due to slopes
if obstacle_id > 0 then // obstacle hit
    {
    instance_destroy() ; // destroy bullet after it hits something
    }
    
// check for outside room
if x < 0 or y < 0 or x > room_width or y > room_height then
    {
    instance_destroy() ; // destroy bullet after it leaves room
    }
    
// update position
x = x + horiz_speed ; // okay to move into solids
