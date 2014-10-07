// this script is similar to the general state physics, but for physical objects that can only stand or fall
// it is recommended to be used to speed up the game, since this script is run in the Step event

// this variable indicates switch of direction which flips the character sprite
// important for cleaning up case where flipping causes collisions with nearby solids
switched_direction = false ;

// process platforms, conveyors and such
// this has to be done before the character movement
scrProcessIsAbove() ;
if platform_id >= 0 then scrPlatformHorizontalMovement() ;
// don't process vertical platforms here, as the complexity of stacked movables makes it better to be in Begin Step of platform
if conveyor_id >= 0 then scrProcessConveyor() ;
// don't process currents and winds here because they are processed in scrMoveInAir() ;

// process state variable
switch state
    {
    case STANDING: scrProcessCharStandingSimple() ; break ;
    case FALLING: scrProcessCharFalling() ; break ;
    case DYING: scrProcessCharDying() ; break ;
    }

// process gravity in relevant states
// not using built-in gravity because want better control for collisions
switch state
    {
    case FALLING:
        {
        scrProcessGravity() ;
        break ;
        }
    default: // handle all other states, which have no gravity
        {
        vert_speed = 0 ;
        break ;   
        }
    }
    
// clean up any sticking due to movement or flipping    
scrGetUnstuck() ;

// keep within bounds of room
if x < 0 then x = 0 ;
if x > room_width then x = room_width ;
if y > room_height then y = room_height ;
