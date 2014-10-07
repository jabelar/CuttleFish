// assumes range_remaining variable is assigned by bomb object during explosion instance creation
// creates a chain reaction effect
if range_remaining > 0 then // propagate
    {
    // best to use collision line in case overlapping breakables (want to detect first)
    breakable_id = collision_line(x, y, x + propagate_x, y + propagate_y, objParentBreakableObstacle, false, true) ;
    if breakable_id < 0 then // no breakable
        {
        // create adjacent explosions in direction of propagation wherever no solid
        if collision_line(x, y, x + propagate_x, y + propagate_y, objParentObstacle, false, true) < 0 then
            {
            explosion_id = instance_create(x + propagate_x, y + propagate_y, objBombExplosion) ;
            explosion_id.range_remaining = range_remaining - 1 ; // pass on remaining range
            explosion_id.propagate_x = propagate_x ; // keep propagating in same direction
            explosion_id.propagate_y = propagate_y ;
            }
        // also propagate if turret and allowed to kill turrets
        turret_id = collision_line(x, y, x + propagate_x, y + propagate_y, objParentTurret, false, true) ;
        if ALLOW_PLAYER_WEAPON_KILL_TURRETS then // clear out turret in propagation path first
            {
            with turret_id
                {
                explosion_id = instance_create(x, y, objBombExplosion) ;
                explosion_id.range_remaining = 0 ; // only blast one level of turret
                explosion_id.propagate_x = 0 ; // no propagation
                explosion_id.propagate_y = 0 ;
                scrKillTurret() ;
                }
            }
        }
    else // breakable, so check if allowed to break
        {
        if ALLOW_PLAYER_WEAPON_BREAK_BREAKABLES then // clear out breakable in propagation path first
            {
            with breakable_id
                {
                explosion_id = instance_create(x, y, objBombExplosion) ;
                explosion_id.range_remaining = 0 ; // only blast one level of breakables
                explosion_id.propagate_x = 0 ; // no propagation
                explosion_id.propagate_y = 0 ;
                scrBreakBreakable() ;
                }
            }
        }
    }
// then destroy self
instance_destroy() ;
