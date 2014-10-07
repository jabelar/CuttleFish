// this updates some state variables depending on current situation character is in
// this primarily looks for things that affect response to player input, such as obstacle in the way
// other special obstacles such as platforms, conveyors and currents that affect physics are
// processed in step events.

// note ladders and slopes are special need to take precedence
character_is_over = NOTHING ;
if place_meeting(x, y, objParentObstacle) then 
    {
    if not place_meeting(x, y, objParentJumpThroughObstacle) then
        {
        if not place_meeting(x, y, objParentJumpThroughPlatform) then
            {
            if not place_meeting(x, y, objParentJumpThroughSlopeLeft) then
                {
                if not place_meeting(x, y, objParentJumpThroughSlopeRight) then character_is_over = SOLID ;
                }
            }
        }
    }
if place_meeting(x, y, objParentLadder) then character_is_over = LADDER ;
ladder_is_horizontal_bar = place_meeting(x, y, objParentBar) ;
