// intended to be called from within objPlayer

if RESTART_LEVEL_ON_DEATH or global.number_of_players > 1 then // full restart, can't do partial restarts with multiple players
    {
    // need to restart all rooms, which means turn off persistence
    // reset score and coins collected values
    score = global.score_before_level ;
    global.coins_collected = global.coins_collected_before_level ;
    // restart current room for the player
    room_goto(global.current_room[global.current_player]) ;
    }
else // partial restart
    {
        // back to starting position and state in room
        x = xstart ;
        y = ystart ;
        event_perform(ev_create, 0) ;
        instance_activate_all() ; // this is important in rooms where selective deactivation is occurring
        // all remaining enemies also back to starting positions in room
        // first convert all trapped back to original enemies
        with (objParentEnemyTrapped)
            {
            enemy_id = instance_create(x, y, original_object_index) ;
            instance_destroy() ;
            }
        with (objParentEnemy)
            {
            x = xstart ;
            y = ystart ;
            event_perform(ev_create, 0) ;
            }
        // convert all diggings back to original
        with (objRefillMarker)
            {
            refill_id = instance_create(x, y, refill_object_index) ;
            refill_id.original_object_index = original_object_index ; // pass on reference to original object
            instance_destroy() ;
            }
        with (objParentRefillHazard)
            {
            instance_create(x, y, original_object_index) ;
            instance_destroy() ;
            }
        // put all platforms in original positions
        // this is important to ensure enemies take same starting path in 
        // case they encounter platforms
        with (objParentPlatform)
            {
            x = xstart ;
            y = ystart ;
            event_perform(ev_create, 0) ;
            }
        // clear out all player weapons
        with (objParentPlayerWeapon)
            {
            instance_destroy() ;
            }        
        // clear out all enemy weapons
        with (objParentEnemyWeapon)
            {
            instance_destroy() ;
            }
        // put companion in starting position
        with (objParentCompanion)
            {
            x = xstart ;
            y = ystart ;
            event_perform(ev_create, 0) ;
            }        
        // put movables back in starting position
        with (objParentMovableObstacle)
            {
            x = xstart ;
            y = ystart ;
            event_perform(ev_create, 0) ;
            }
        // reset any level timer
        if instance_exists(objParentLevelTimer) then 
            {
            global.room_time = global.initial_room_time ;
            }    
    }    
