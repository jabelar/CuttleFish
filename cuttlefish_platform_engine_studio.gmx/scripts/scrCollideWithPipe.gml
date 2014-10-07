// intended to be called within pipe object
// check if player is ducking on top of pipe
if place_meeting(x, y-1, objPlayer) and objPlayer.state = DUCKING then // enter pipe
    {
    // set position
    objPlayer.x = portal_entry_x ;
    objPlayer.y = portal_entry_y ;
    // change sound if appropriate
    // sound_stop_all() ;
    }
