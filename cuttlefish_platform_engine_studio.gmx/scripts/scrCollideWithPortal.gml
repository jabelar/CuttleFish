// intended to be called from objPlayer when collided with a portal

with (other)
    {
    if variable_local_exists("room_reference") then
        {
        global.entered_by_portal = true ;
        // set position in next room (indexed by roonm_reference) to start character at
        global.portal_entry_x = portal_entry_x ;
        global.portal_entry_y = portal_entry_y ;
        // turn off all sound
        sound_stop_all() ;      
        room_goto(room_reference) ; // this should be set in instance creation code in room editor
        }
    else // just go to next
        {
        // turn off all sound
        sound_stop_all() ;
        room_goto_next() ;
        }
    }
