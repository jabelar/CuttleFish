break ;
// okay to be stuck if in dying state
if state = DYING then break ;

// if movement handled well, should never be stuck due to movement        
// but if still stuck and just moved then return to previous position
if place_meeting(x, y, objParentObstacle) then
    {
    if not place_meeting(x, y, objParentJumpThroughObstacle) then
        {
        if not place_meeting(x, y, objParentJumpThroughPlatform) then
            {
            if x != xprevious or y != yprevious then
                {
                x = xprevious ;
                y = yprevious ;
                }
            else // maybe squashed by platform or something
                {
                scrOutsideSolidUp(sprite_height) ;
                }
            }
        }
    }
