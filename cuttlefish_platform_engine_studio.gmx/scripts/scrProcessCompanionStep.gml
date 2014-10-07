if distance_to_object(objPlayer) > MAX_COMPANION_LAG then // need to catch up
    {
    scrCompanionCatchUp() ;
    }
else // move independently
    {
    // AI instead of user input into the state machine
    scrProcessCompanionAI() ;
    }

// now process state transitions and physics
scrProcessStatePhysics() ;

// update sprite direction
scrUpdateSpriteDirection() ;

// update trail effect array
if ALLOW_SONIC_TRAIL_EFFECT then
    {
    for (i=TRAIL_SIZE; i>0; i-=1)
        {
        trail_x[i] = trail_x[i-1] ;
        trail_y[i] = trail_y[i-1] ;
        }
    trail_x[0] = x ;
    trail_y[0] = y ;
    }
    
// update running alarm
if state = WALKING and running_enabled then
    {
    if alarm[0] <= 0 then alarm[0] = run_delay ; // if disabled then set alarm
    }
else
    {
    alarm[0] = -1 ; // disable alarm
    }
