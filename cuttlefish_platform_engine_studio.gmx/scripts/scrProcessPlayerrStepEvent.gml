// if entered room via a portal, then process that reference
if global.entered_by_portal then
    {
    x = global.portal_entry_x ;
    y = global.portal_entry_y ;
    }
global.entered_by_portal = false ;

// process user input
scrProcessInput() ;

// process state transitions and physics
scrProcessStatePhysics() ;

// update sprite direction
scrUpdateSpriteDirection() ;

// update trail effect array
if trail_enabled then
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

// process falling sound
if state = FALLING then
    {
    if sound_falling != NONE then // there is sound assigned to play
        {
        // check if it is already playing
        if not sound_isplaying(sound_falling) then sound_play(sound_falling) ;
        }
    }
else // not falling so stop falling sound
    {
    if sound_falling != NONE then sound_stop(sound_falling) ;
    }
    
// process shielding
if ALLOW_SHIELD then
    {
    if kShield and shield_strength > 0 and shield_min_regen then // use shield
        {
        shield_deployed = true ;
        shield_strength = shield_strength - shield_use_rate ;
        if shield_strength < 0 then shield_strength = 0 ;
        }
    else // regenerate shield
        {
        shield_deployed = false ;
        shield_strength = shield_strength + shield_regen_rate ;
        if shield_strength > 30 then shield_min_regen = true else shield_min_regen = false ;
        if shield_strength > 100 then shield_strength = 100 ;
        }
    }
            
// process weapon switching
if kSwitchWeaponPressed then
    {
    switch current_weapon_type
        {
        case PLAYER_WEAPON_LASER: current_weapon_type = PLAYER_WEAPON_BOMB; break ;
        case PLAYER_WEAPON_BOMB: current_weapon_type = PLAYER_WEAPON_SWORD; break ;
        case PLAYER_WEAPON_SWORD: current_weapon_type = PLAYER_WEAPON_FIRE_FLOWER; break ;
        case PLAYER_WEAPON_FIRE_FLOWER: current_weapon_type = PLAYER_WEAPON_NONE; break ;
        case PLAYER_WEAPON_NONE: current_weapon_type = PLAYER_WEAPON_LASER; break ;
        }
    }

// process alarms
scrActivateAlarms() ; // manually decrement so no need for separate events
if alarm[0] = 0 then state = RUNNING ;
// other alarms are processed elsewhere as needed
