// This AI will try to home in on nearest enemy, using normal movements

scrInitializeInputVariables() ;

// find nearest enemy
nearest_id = instance_nearest(x, y, objParentEnemy) ;
if nearest_id > 0 and distance_to_object(nearest_id) < COMPANION_SENSE_RANGE then // there is at least one enemy in room and within sensing range
    {
    // track enemy
    last_seen_x = nearest_id.x ;
    last_seen_y = nearest_id.y ;
    }
else // no more enemies in range
    {
    // track player
    if distance_to_object(objPlayer) > COMPANION_CLOSENESS_LIMIT then
        {
        last_seen_x = objPlayer.x ;
        last_seen_y = objPlayer.y ;
        }
    else // stay where you are
        {
        last_seen_x = x ;
        last_seen_y = y ;
        }
    }
      
scrProcessSurroundings() ;       
// the homing dead zone makes it so companion doesn't wiggle when straight under char
if last_seen_x + HOMING_DEAD_ZONE < x then
    {
    kLeft = true ;
    kNone = false ;
    if alarm[1] = 1 then kLeftPressed = true ; // this allows companion to come off ladder occasionally
    }
else if last_seen_x - HOMING_DEAD_ZONE > x then 
    {
    kRight = true ;
    kNone = false ;
    if alarm[1] = 1 then kRightPressed = true ; // this allows companion to come off ladder occasionally
    }
    
// dead zone more selective vertically or won't exit top and bottom of ladders properly,
if last_seen_y < y then // target is above
    {
    kUp = true ;
    kNone = false ;
    if character_is_over = LADDER then // climb
        {
        if  last_seen_y + HOMING_DEAD_ZONE < y then  // suppress other movement unless close to level with target
            {
            kRight = false ;
            kRightPressed = false ;
            kLeft = false ;
            kLeftPressed = false ;
            }
        }
    else // occasionally jump
        {
        if alarm[1] = 1 then kJumpPressed = true ;
        }
    }
else if last_seen_y > y and (character_is_above = LADDER or character_is_over = LADDER) then 
    {
    kDown = true ;
    kNone = false ;
    if last_seen_y - HOMING_DEAD_ZONE > y then // suppress other movement unless close to level with target
        {
        kRight = false ;
        kRightPressed = false ;
        kLeft = false ;
        kLeftPressed = false ;
        }
    }
    
// process companion weapon
// only need to process if there is at least one enemy in room
// default to laser unless something closer
current_weapon_type = PLAYER_WEAPON_LASER ;
// choose hand-to-hand weapon based on proximity of nearest enemy
if nearest_id > 0 then
    {
    if distance_to_object(nearest_id) < COMPANION_SENSE_RANGE / 2 then // enemy in close range
        {
        current_weapon_type = PLAYER_WEAPON_SWORD ;
        }
    }
// now process weapon based on type
switch current_weapon_type
    {
    case PLAYER_WEAPON_LASER:
        {
        // find any targets, then shoot at decision interval if something in line of fire
        if facing = LEFT then // look for enemy and turret targets left
            {
            target_enemy_id = collision_line(x, y, 0, y, objParentEnemy, false, true) ;
            target_turret_id = collision_line(x, y, 0, y, objParentTurret, false, true) ;
            }
        else // look for enemy and turrent targets right
            {
            target_enemy_id = collision_line(x, y, room_width, y, objParentEnemy, false, true) ;
            target_turret_id = collision_line(x, y, room_width, y, objParentTurret, false, true) ;
            }            
        if (target_enemy_id > 0 or target_turret_id > 0) and alarm[1] = round(room_speed * COMPANION_DECISION_FREQ / 2) then
            {
            kWeaponPressed = true ;
            }
        break ;
        }
    case PLAYER_WEAPON_BOMB:
        {
        // only do this if can't kill player, as can't make ai smart enough to not bomb player
        if not ALLOW_BOMB_KILL_SELF then
            {
            // only plant bomb on decision timeframe, but offset from other decisions
            if alarm[1] = round(room_speed * COMPANION_DECISION_FREQ /2) then kWeaponPressed = true ;
            }
        break ;
        }
    case PLAYER_WEAPON_SWORD:
        {
        if nearest_id > 0 then
            {
            if distance_to_object(nearest_id) < 32 then // fine tune this based on actual sword
                {
                // swing sword
                kWeaponPressed = true ;
                }
            }
        break ;
        }
    }
