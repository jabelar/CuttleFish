// assumes view[0] is main view for relative sound positioning
// argument0 should be sound index
pan_range = view_wview[0] / 2 ;
view_center = view_xview[0]+pan_range ;
pan_amount = (x - view_center)/pan_range ; // range between -1 and 1
// limit range
pan_amount = min(1, max(-1, pan_amount)) ;
sound_pan(argument0, pan_amount) ;
