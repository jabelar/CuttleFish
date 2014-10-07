// this is to suppress sounds that are outside the view
// check if in view, leave some buffer to allow for non-centered origins
// argument0 is the sound resource index
// argument1 is the view to check
if x >= view_xview[argument1]-32 then
    {
    if x <= view_xview[argument1]+view_wview[argument1]+32 then
        {
        if y >= view_yview[argument1]-32 then
            {
            if y <= view_yview[argument1]+view_hview[argument1]+32 then
                {
                sound_play(argument0) ;
                }
            }
        }
    }
