// this is intended to be called within weapon object step event
// track wielder object position
x = wielder_id.x ;
y = wielder_id.y ;
// track wielder object direction
// note want to use built in scaling so that bounding box is flipped
image_xscale = wielder_id.xscale ;
image_yscale = wielder_id.yscale ;

// check for collisions, if first hit not already processed
// so can hit multiple objects, but only if hit in same step.  After one or more objects
// have been hit, then no further collisions processed.

if not has_hit then // has not hit yet
    {
    with (objParentEnemy) // use with, not if to ensure all enemies simultaneously contacted are processed
        {
        if place_meeting(x, y, other.id) then // hit by weapon
            {
            other.has_hit = true ;
            scrKillEnemy() ;
            }
        }
    
    // check all turrets for collision if allowed
    if ALLOW_PLAYER_WEAPON_KILL_TURRETS then
        {
        with (objParentTurret)
            {
            if place_meeting(x, y, other.id) then // hit by weapon
                {
                other.has_hit = true ;
                scrKillTurret() ;
                }
            }
        }
    
    // check for collisions with breakables if allowed
    if ALLOW_PLAYER_WEAPON_BREAK_BREAKABLES then
        {
        with (objParentBreakableObstacle) // use with instead of if so that can break multiple simultaneously
            {
            if instance_place(x, y, other.id) then // hit by weapon
                {
                other.has_hit = true ; 
                scrBreakBreakable() ;
                }
            }
        }

    // check enemy bullets for collision if allowed
    if ALLOW_PLAYER_MELEE_KILL_ENEMY_WEAPONS then
        {
        with (objParentEnemyWeapon) 
            {
            if place_meeting(x, y, other.id) then // hit by weapon
                {
                other.has_hit = true ;
                instance_destroy() ;
                }
            }
        }
    }

// check for end of swing, indicated by end of animation
if image_index = sprite_get_number(sprite_index) - 1 then // at last image in animation
    {
    wielder_id.weapon_swinging = false ;
    instance_destroy() ;
    }
