// note the order of things here is very important, must move platform then objects
// update platform
if place_meeting(x, y, objParentObstacle) or place_meeting(x, y, objPlatformMarker) then 
    {
    hspeed = -hspeed ;
    }
