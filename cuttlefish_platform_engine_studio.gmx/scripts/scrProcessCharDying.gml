// default variable settings
sprite_index = sprite_dying ;
bounce = false ;

// stop any movement
vert_speed = 0 ;

// check if enemy, companion, character or weapon that is dying
if object_is_ancestor(id.object_index, objParentEnemy) then // enemy is dying
    {
    if convertible then // enemy converts to something else when killed
        {
        converted_id = instance_create(x, y, convertible_object_index) ;
        converted_id.facing = facing ; // may be useful to pass this variable
        if ALLOW_ENEMY_RESPAWN then converted_id.respawn_id = respawn_id ; // pass along any respawn marker
        instance_destroy() ; // destroy self
        }
    else // not convertible
        {
        if image_index = sprite_get_number(sprite_dying) - 1 then // destroy at end of animation
            {
            // check if it should respawn
            if ALLOW_ENEMY_RESPAWN then
                {
                // assumes a respawn_id was assigned by game controller
                with (respawn_id)
                    {
                    alarm[0] = ENEMY_RESPAWN_DELAY ;
                    }
                }
            instance_destroy() ;
            }
        }
    }
else if object_is_ancestor(id.object_index, objParentPlayerWeapon) then // weapon to be destroyed
    {
    if convertible then // weapon converts to something else when destroyed
        {
        converted_id = instance_create(x, y, convertible_object_index) ;
        converted_id.facing = facing ; // may be useful to pass this variable
        }
    else // not convertible
        {
        if image_index = sprite_get_number(sprite_dying) - 1 then // destroy at end of animation
            {
            instance_destroy() ;
            }
        }
    }
else if object_is_ancestor(id.object_index, objParentCompanion) then // companion is dying
    {
    if image_index = sprite_get_number(sprite_dying) - 1 then // check for end of animation
        {
        // companion never really dies
        // simply jump to character position
        scrCompanionCatchUp() ;
        }
    }
else // must be the character dying
    {
    if not sound_isplaying(sound_death) then sound_play(sound_death) ;
    // check for end of any dying animation
    if image_index = sprite_get_number(sprite_dying) - 1 then
        {
        // check for end of game, meaning all players have lost all their lives
        var i, end_of_game ;
        end_of_game = true ;
        for (i=0; i<global.number_of_players; i+=1)
            {
            if global.number_of_lives[i] > 0 then end_of_game = false ;
            }
        if end_of_game then
            {
            room_goto(roomGameOver) ;
            break ; // need this because room changes don't happen immediately
            }
        // restart level, but with next player that still has lives
        // must be at least one with lives left, or else would have triggered end of game
        global.current_player += 1 ;
        if global.current_player >= global.number_of_players then global.current_player = 0 ;
        while (global.number_of_lives[global.current_player] <= 0)
            {
            global.current_player += 1 ;
            if global.current_player >= global.number_of_players then global.current_player = 0 ;
            }
        scrRestartLevel() ;
        }
    }
