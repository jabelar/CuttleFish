ladder_id = instance_place(x, y, objParentLadder) ;
if ladder_id < 0 then break ; // this handles case where bar is deactivated to check for overlap of horizontal bar with a normal ladder
// depends on whether normal ladder or horizontal bar
bar_id = instance_place(x, y, objParentBar) ;
if bar_id >= 0 then // over a horizontal bar
    {
    ladder_is_horizontal_bar = true ; // will need this later
    ladder_id = bar_id ; // bars take precedence over normal ladders
    y = ladder_id.y + sprite_yoffset ; // line up top of sprites, assuming ladder origin at 0, 0 and bar near top
    }
else // over a normal ladder
    {
    ladder_is_horizontal_bar = false ;
    x = ladder_id.x + ladder_id.sprite_width / 2 ;
    }
