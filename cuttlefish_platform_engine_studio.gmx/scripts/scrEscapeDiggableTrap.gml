// intended to be called from trapped enemy object
// this alarm is used to escape from diggables
// escape towards player character, if enabled
if not escape_traps_enabled then break ; // don't escape if not enabled to do so

// but only escape if room to do so
// check both up-right and up-left positions
// can be blocked by solids or by other enemies (if not allow enemy overlap)
up_right_free = false ;
up_left_free = false ;
if place_free(x+sprite_width, y-sprite_width) then // no obstacle
    {
    if ALLOW_ENEMY_OVERLAP then // don't need to check for enemy
        {
        up_right_free = true ;
        }
    else // check for enemy
        {
        if not place_meeting(x+sprite_width, y-sprite_width, objParentEnemy) then
            {
            up_right_free = true ;
            }
        }
    }
if place_free(x-sprite_width, y-sprite_width) then // no obstacle
    {
    if ALLOW_ENEMY_OVERLAP then // don't need to check for enemy
        {
        up_left_free = true ;
        }
    else // check for enemy
        {
        if not place_meeting(x-sprite_width, y-sprite_width, objParentEnemy) then
            {
            up_left_free = true ;
            }
        }
    }
if objPlayer.x > x then // exit toward right
    {
    if up_right_free then
        {
        original_id = instance_create(x+sprite_width, y-sprite_height, original_object_index) ;    
        original_id.state = STANDING ;
        if ALLOW_ENEMY_RESPAWN then original_id.respawn_id = respawn_id ; // remember any respawn marker
        // destroy trapped object version
        instance_destroy() ;        
        }
    else if up_left_free then
        {
        original_id = instance_create(x-sprite_width, y-sprite_height, original_object_index) ;    
        original_id.state = STANDING ;
        if ALLOW_ENEMY_RESPAWN then original_id.respawn_id = respawn_id ; // remember any respawn marker
        // destroy trapped object version
        instance_destroy() ;        
        }
    else // both blocked
        {
        // do nothing
        }   
    }
else // exit toward left
    {
    if up_left_free then
        {
        original_id = instance_create(x-sprite_width, y-sprite_height, original_object_index) ;    
        original_id.state = STANDING ;
        if ALLOW_ENEMY_RESPAWN then original_id.respawn_id = respawn_id ; // remember any respawn marker
        // destroy trapped object version
        instance_destroy() ;        
        }
    else if up_right_free then
        {
        original_id = instance_create(x+sprite_width, y-sprite_height, original_object_index) ;    
        original_id.state = STANDING ;
        if ALLOW_ENEMY_RESPAWN then original_id.respawn_id = respawn_id ; // remember any respawn marker
        // destroy trapped object version
        instance_destroy() ;        
        }
    else // both blocked
        {
        // do nothing
        }   
    }
    
