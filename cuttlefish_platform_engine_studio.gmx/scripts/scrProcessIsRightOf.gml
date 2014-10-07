// this updates some state variables depending on current situation character is in
// this primarily looks for things that affect response to player input, such as obstacle in the way
// other special obstacles such as platforms, conveyors and currents that affect physics are
// processed in step events.

character_is_right_of = NOTHING ;
// while surroundings are sort of an absolute thing, it is useful to 
// process according to movement possibilities from current state which
// is different for normal ladder
if state = CLIMBING and not place_meeting(x, y, objParentBar) then
    {
    step = abs(sprite_width) ;
    }
else
    {
    step = 1 ;
    }
if collision_line(bbox_left-step, bbox_top, bbox_left-step, bbox_bottom, objParentSlopeLeft, true, true) >= 0 then character_is_right_of = SLOPE_LEFT ;
else if collision_line(bbox_left-step, bbox_top, bbox_left-step, bbox_bottom, objParentObstacle, true, true) >=0 then 
    {
    if collision_line(bbox_left-step, bbox_top, bbox_left-step, bbox_bottom, objParentJumpThroughObstacle, true, true) < 0 then
        {
        if collision_line(bbox_left-step, bbox_top, bbox_left-step, bbox_bottom, objParentJumpThroughPlatform, true, true) < 0 then 
            {
            if collision_line(bbox_left-step, bbox_top, bbox_left-step, bbox_bottom, objParentJumpThroughSlopeRight, true, true) < 0 then character_is_right_of = SOLID ;
            }
        }
    }
else if collision_line(bbox_left-step, bbox_top, bbox_left-step, bbox_bottom, objParentLadder, true, true) >= 0  then character_is_right_of = LADDER ;
