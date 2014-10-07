// intended to be called from refill marker

// only continue if player character not colliding with refill marker
if place_meeting(x, y, objPlayer) then break ;

// hold other because enemy trapped
// center in trap
other.x = x + ceil(sprite_width/2) ; // used ceil because auto center in sprite editor does that
other.y = y + ceil(sprite_height/2) ;
with (other)
    {
    // replace with trapped object, set alarm for escape
    trapped_id = instance_create(x, y, trapped_object_index) ;
    trapped_id.alarm[1] = room_speed * REFILL_ESCAPE_DELAY ;
    trapped_id.original_object_index = object_index ; // remember what type of enemy was originally
    trapped_id.worth = worth ; // remember worth
    trapped_id.sound_death = sound_death ; // remember death sound
    trapped_id.escape_traps_enabled = escape_traps_enabled ; // remember whether allowed to escape traps
    if ALLOW_ENEMY_RESPAWN then trapped_id.respawn_id = respawn_id ; // remember any respawn markers
    instance_destroy() ;
    }

