// this variable indicates switch of direction which flips the character sprite
// useful if you want to slow down runs, do a special turn around animation, or do a skid to stop
switched_direction = false ;

// process platforms, conveyors and such
// this has to be done before the character movement
scrProcessIsAbove() ;
if platform_id >= 0 then scrPlatformHorizontalMovement() ;
// don't process vertical platforms here, as the complexity of stacked movables makes it better to be in Begin Step of platform
if conveyor_id >= 0 then scrProcessConveyor() ;
// don't process currents and winds here because they are processed in scrMoveInAir() ;

// process state variable
// not using built-in gravity because want more control over timing of when gravity effect is applied
switch state
    {
    case STANDING: 
        {
        vert_speed = 0 ; // no gravity effect
        scrProcessCharStanding() ; 
        break ;
        }
    case JUMPING: 
        {
        scrProcessGravity() ;
        scrProcessCharJumping() ; 
        break ;
        }
    case FALLING:
        {
        scrProcessGravity() ;
        scrProcessCharFalling() ; 
        if object_index != objPlayer then break ; // further code is for playe object only
        scrProcessIsBelow() ;
        if breakable_id >= 0 then scrProcessBreakableObstacle() ;
        break ;
        }
    case DYING: 
        {
        vert_speed = 0 ; // no gravity effect
        scrProcessCharDying() ; 
        break ;
        }
    case SHIELDING: 
        {
        vert_speed = 0 ; // no gravity effect
        scrProcessCharShielding() ; 
        break ;
        }
    case WALKING: 
        {
        vert_speed = 0 ; // no gravity effect 
        scrProcessCharWalking() ;
        break ;
        }
    case RUNNING: 
        {
        vert_speed = 0 ; // no gravity effect
        scrProcessCharRunning() ; 
        break ;
        }
    case CLIMBING:
        {
        vert_speed = 0 ; // no gravity effect
        scrProcessCharClimbing() ; 
        break ;
        }
    case FLYING: 
        {
        vert_speed = 0 ; // no gravity effect 
        scrProcessCharFlying() ;
        break ;
        }
    case DUCKING: 
        {
        vert_speed = 0 ; // no gravity effect
        scrProcessCharDucking() ; 
        break ;
        }
    case SUPER_JUMPING: 
        {
        scrProcessGravity() ;
        scrProcessCharSuperJumping() ; 
        break ;
        }
    case DOUBLE_JUMPING: 
        {
        scrProcessGravity() ;
        scrProcessCharDoubleJumping() ; 
        break ;
        }
    case WALL_JUMPING: 
        {
        scrProcessGravity() ; 
        scrProcessCharWallJumping() ;
        break ;
        }
    }

    
// clean up any sticking due to movement or flipping    
scrGetUnstuck() ;

// keep within bounds of room
if x < 0 then x = 0 ;
if x > room_width then x = room_width ;
if y > room_height then y = room_height ;

