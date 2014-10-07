// this is intended to be called from a game controller that will also
// contain the functionality to unpause
screen_redraw() ;
// now process different depending whether views are enabled
if view_enabled then // use view sizing
    {
    screenshot = background_create_from_screen(view_xport[0], view_yport[0], view_wport[0], view_hport[0], false, false);
    // now make it a background, assuming background 7 not already used in the game
    background_index[7] = screenshot;
    background_visible[7] = true;
    // now position it in the view location and negate any view scaling
    background_x[7] = view_xview[0];
    background_y[7] = view_yview[0];
    original_wview = view_wview[0] ; // remember so you can restore when unpausing
    original_hview = view_hview[0] ;
    view_wview[0] = view_wport[0];
    view_hview[0] = view_hport[0];
    }
else // use room sizing
    {
    screenshot = background_create_from_screen(0, 0, room_width, room_height, false, false);
    // now make it a background, assuming background 7 not already used in the game
    background_index[7] = screenshot;
    background_visible[7] = true;
    // now position it in the view location and negate any view scaling
    background_x[7] = view_xview[0];
    background_y[7] = view_yview[0];
    }
// now effectively pause by deactivating everything other than the controller and view controller
// but since some may already be deactive need to remember which ones so they don't get mistaken activated during unpause
array_size = 0 ;
with (all)
    {
    // this will only run for active instances, so record their id
    other.active_array[other.array_size] = id ;
    other.array_size += 1 ;
    }
instance_deactivate_all(true);
