// this updates some state variables depending on current situation character is in
// this primarily looks for things that affect response to player input, such as obstacle in the way
// other special obstacles such as platforms, conveyors and currents that affect physics are
// processed in step events.

// update diggables
// little tricky because want to find block next to one standing on
object_below_id = instance_position(x, y-sprite_yoffset+sprite_height+1, all) ;
diggable_left_id = noone ;
diggable_right_id = noone ;
if object_below_id != noone then 
    {
    with (object_below_id)
        {
        // note assumption that origin of all blocks is at 0,0
        // use instance position because may be above two
        other.diggable_left_id = instance_position(x-1, y, objParentDiggable) ;
        other.diggable_right_id = instance_position(x+sprite_width+1, y, objParentDiggable) ;
        }
    }
