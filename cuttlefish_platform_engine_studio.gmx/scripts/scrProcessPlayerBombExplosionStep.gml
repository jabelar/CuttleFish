// simple collision, but putting in step script for equivalence to other weapons
// check all enemies for collision, need to check all in case overlapping enemies
with (objParentEnemy)
    {
    if place_meeting(x, y, other) and state != DYING then // hit by explosion but ignore if already dying
        {
        scrKillEnemy() ;
        }
    }

// check all turrets for collison if allowed
if ALLOW_PLAYER_WEAPON_KILL_TURRETS then
    {
    with (objParentTurret)
        {
        if place_meeting(x, y, other.id) then // hit by weapon
            {
            scrKillTurret() ;
            }
        }
    }

// can also kill self and companions if allowed and not already dying or shielded
if ALLOW_BOMB_KILL_FRIENDLY then
    {
    if place_meeting(x, y, objPlayer) then // hit player
        {
        with (objPlayer)
            { 
            if state != DYING and not shield_deployed then
                {
                scrKillPlayer() ; 
                }
            }
        }
    if place_meeting(x, y, objParentCompanion) then // hit companion
        {
        with (objParentCompanion)
            { 
            if state != DYING and not shield_deployed then
                {
                scrKillCompanion() ; 
                }
            }
        }
    }

    
