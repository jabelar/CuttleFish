// this updates some state variables depending on current situation character is in
// this primarily looks for things that affect response to player input, such as obstacle in the way
// other special obstacles such as platforms, conveyors and currents that affect physics are
// processed in step events.

character_is_above = NOTHING ;
obstacle_id = collision_line(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, objParentObstacle, true, true) ;
if obstacle_id >= 0 then 
    {
    // handle case where you're overlapping a jumpthrough, only declare solid if not currently over the same obstacle
    over_id = collision_line(bbox_left, bbox_bottom, bbox_right, bbox_bottom, objParentObstacle, true, true) ;
    if obstacle_id != over_id then character_is_above = SOLID ;
    }
else if collision_line(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, objParentLadder, true, true) >= 0 then character_is_above = LADDER ;
// remember id of any platform character is on
platform_id = collision_line(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, objParentPlatform, true, true) ;
// remember id of any conveyor character is on
conveyor_id = collision_line(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, objParentConveyor, true, true) ;
