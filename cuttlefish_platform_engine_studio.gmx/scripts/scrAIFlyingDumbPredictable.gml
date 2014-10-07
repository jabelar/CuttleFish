scrInitializeInputVariables() ;

// movement
scrProcessSurroundings() ;

// turn around if right next to an obstacle (which will happen due to move_contact_solid() in previous step)
if facing = LEFT then
    {
    if place_meeting(x-1, y, objAIMarker) or character_is_right_of = SOLID then // turn around
        {
        kRight = true ;
        }
    else // keep going
        {
        kLeft = true ;
        }
    }
if facing = RIGHT then
    {
    if place_meeting(x+1, y, objAIMarker) or character_is_left_of = SOLID then // turn around
        {
        kLeft = true ;
        }
    else
        {
        kRight = true ;
        }
    }

  
           
