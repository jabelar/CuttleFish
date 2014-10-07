// this is intended to be called from a game controller that will also
// contain the functionality to unpause
// diable background, and delete resource
background_index[7] = -1 ;
background_visible[7] = false ;
background_delete(screenshot);
if view_enabled then
    {
    // now restore view scaling
    view_wview[0] = original_wview ;
    view_hview[0] = original_hview ;
    }
// now reactivate everything that was supposed to be active
var i ;
for (i=0; i<array_size; i+=1)
    {
    instance_activate_object(active_array[i]) ;
    }
