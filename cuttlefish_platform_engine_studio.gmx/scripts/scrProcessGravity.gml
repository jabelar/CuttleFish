vert_speed = vert_speed + GRAV * my_gravity_factor ;

// limit maximum falling speed
// set max falling speed depending on parachute deployment
if parachute_deployed then max_fall_speed = 2 else max_fall_speed = MAX_FALL_SPEED ;
if vert_speed > max_fall_speed then vert_speed = max_fall_speed ;

// note that actual updating of the y position is done within the states where gravity is in effect
