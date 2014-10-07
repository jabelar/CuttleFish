// note the order of things here is very important, must move platform then objects
// since this is intended to be called in character step event then the movement of the
// platform must be in its begin step

// move with platform, where platform_id is expected ot have been assigned in sensing script scrProcessIsAbove()
if platform_id.hspeed > 0 then
    {
    scrContactSolidRight(platform_id.hspeed/my_speed_factor) ; // need to negate speed factor since it doesn't apply to platform movement
    }
else
    {
    scrContactSolidLeft(abs(platform_id.hspeed/my_speed_factor)) ;
    }
