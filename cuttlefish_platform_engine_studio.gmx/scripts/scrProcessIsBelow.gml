// this updates some state variables depending on current situation character is in
// this primarily looks for things that affect response to player input, such as obstacle in the way
// other special obstacles such as platforms, conveyors and currents that affect physics are
// processed in step events.

character_is_below = NOTHING ;
if collision_line(bbox_left, bbox_top-1, bbox_right, bbox_top-1, objParentObstacle, true, true) >= 0 then
    { 
    if collision_line(bbox_left, bbox_top-1, bbox_right, bbox_top-1, objParentJumpThroughPlatform, true, true) < 0 then 
        {
        if collision_line(bbox_left, bbox_top-1, bbox_right, bbox_top-1, objParentJumpThroughSlopeRight, true, true) < 0 then 
            {
            if collision_line(bbox_left, bbox_top-1, bbox_right, bbox_top-1, objParentJumpThroughSlopeLeft, true, true) < 0 then character_is_right_of = SOLID ;        
            }
        }
    }
else if collision_line(bbox_left, bbox_top-1, bbox_right, bbox_top-1, objParentLadder, true, true) >= 0 then character_is_below = LADDER ;
// remember id of any bumpable character is below
bumpable_id = collision_line(bbox_left, bbox_top-1, bbox_right, bbox_top-1, objParentBumpableObstacle, true, true) ;
// remember id of any question block character is below
question_block_id = collision_line(bbox_left, bbox_top-1, bbox_right, bbox_top-1, objParentQuestionBlock, true, true) ;
// remember id of any breakable character is below
breakable_id = collision_line(bbox_left, bbox_top-1, bbox_right, bbox_top-1, objParentBreakableObstacle, true, true) ;
