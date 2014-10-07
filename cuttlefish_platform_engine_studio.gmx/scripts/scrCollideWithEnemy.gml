// do not call this from an enemy object
// exit if either object already dying
if state = DYING or other.state = DYING then break ;

// check if enemy is in respawn safety mode
if other.alarm[1] > 0 then break ;

if other.squashable then // process goomba style squashes
    {
    // check to see that bottom of character is higher than halfway up enemy
    if (y-sprite_yoffset+sprite_height) < (other.y-other.sprite_yoffset+other.sprite_height*0.75) then 
        {
        // also only if enemy is not in air
        if other.character_is_above = SOLID or other.character_is_above = SLOPE_RIGHT or other.character_is_above = SLOPE_LEFT or other.character_is_above = LADDER then
            {
            with (other)
                {
                sprite_dying = sprite_squashable ;
                facing = other.facing ; // should go in direction of attacking player or weapon
                scrKillEnemy() ;
                }
            }
        // also if flying (to handle things like flying koopas, which don't exactly squash but need the squash-like bounce
        if other.state = FLYING then
            {
            with (other)
                {
                sprite_dying = sprite_squashable ;
                facing = other.facing ; // should go in direction of attacking player or weapon
                scrKillEnemy() ;
                }
            }
        // also bounce a bit after squashing, super mario style
        vert_speed = INITIAL_SQUASH_BOUNCE ;
        state = JUMPING ;
        }
    else
        {
        // is this player or companion
        if object_index = objPlayer then scrKillPlayer() ;
        else scrKillCompanion() ; // if not player must be companion
        }
    }
else if other.state = TRAPPED then
    {
    // can walk on trapped
    move_outside_all(90, FALL_SPEED) ;
    }
else
    {
    // if shielded ignore collision
    if not shield_deployed then
        {
        // is this player or companion
        if object_index = objPlayer then scrKillPlayer() ;
        else scrKillCompanion() ; // if not player must be companion
        }
    }
