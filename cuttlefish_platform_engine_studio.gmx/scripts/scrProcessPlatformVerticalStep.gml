// note the order of things here is very important, must move platform then objects

// if allowed need to make sure stacks of objects are handled, so give platform_id to whole stack
scrPropagateStackedOnPlatform() ;

// update platform direction
if place_meeting(x, y, objPlatformMarker) then 
    {
    vert_speed = -vert_speed ;
    }

// update platform position
y = y + vert_speed ;

// now process movement for all objects affected by platform movement
with (objPlayer)
    {
    if platform_id = other.id then scrPlatformVerticalMovement() ; // on this platform
    }
with (objParentEnemy)
    {
    if platform_id = other.id then scrPlatformVerticalMovement() ; // on this platform
    }
with (objParentPlayerBomb)
    {
    if platform_id = other.id then scrPlatformVerticalMovement() ; // on this platform
    }
with (objParentCompanion)
    {
    if platform_id = other.id then scrPlatformVerticalMovement() ; // on this platform
    }
with (objParentMovableObstacle)
    {
    if platform_id = other.id then scrPlatformVerticalMovement() ; // on this platform
    }
