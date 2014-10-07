scrInitializeInputVariables() ;

// movement
scrProcessSurroundings() ;

// turn around if right next to an obstacle (which will happen due to move_contact_solid() in previous step)
if facing = LEFT then
    {
    if character_is_right_of = SOLID or x <= 0 then // turn around also if outside room
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
    if character_is_left_of = SOLID or x >= room_width then // turn around
        {
        kLeft = true ;
        }
    else
        {
        kRight = true ;
        }
    }


// automatically "jump" if on solid
if not character_is_above = NOTHING and character_is_over = NOTHING and character_is_below = NOTHING then // okay to bounce
    {
    state = JUMPING ;
    vert_speed = INITIAL_FIRE_FLOWER_BOUNCE ;
    }
    
// now process state transitions and physics
scrProcessStatePhysics() ;

// update sprite direction
scrUpdateSpriteDirection() ;


// check for collisions with enemies
enemy_id = instance_place(x, y, objParentEnemy) ;
if enemy_id > 0 then // enemy hit
    {
    if enemy_id.state != DYING then // don't count hits on enemies already dying
        {
        if state != DYING then // don't count if already hit something
            {
            with (enemy_id)
                {
                scrKillEnemy() ;
                }
            // and kill fireball
            if ALLOW_FIRE_FLOWER_DESTROYED_ON_HIT then state = DYING ;
            }
        }
    }
    
// check for collisions with turrets
// turrets act as obstacle, so need to process by checking to see if touching which will be
// considered a collision
with (objParentTurret)
    {
    if place_meeting(x-1, y, other.id) then scrKillTurret() ; // check to left
    if place_meeting(x+1, y, other.id) then scrKillTurret() ; // check to right
    if place_meeting(x, y-1, other.id) then scrKillTurret() ; // check above
    if place_meeting(x, y+1, other.id) then scrKillTurret() ; // check below    
    }

// check for collisions with breakables
// fire ball will not break breakables, as it is somewhat difficult to code (due to multiple collisions with
// two-hit breakables.  But if you only have one-hit breakables, you could uncomment
// the following code
// if ALLOW_PLAYER_WEAPON_BREAK_BREAKABLES then // allowed to break
//    {
//    with (objParentBreakableObstacle)
//        {
//        if place_meeting(x-1, y, other.id) then scrBreakBreakable() ; // check to left
//        if place_meeting(x+1, y, other.id) then scrBreakBreakable() ; // check to right
//        if place_meeting(x, y-1, other.id) then scrBreakBreakable() ; // check above
//        if place_meeting(x, y+1, other.id) then scrBreakBreakable() ; // check below    
//        }
//    }

// check for outside bottom of room
if y > room_height then
    {
    instance_destroy() ; // destroy after it leaves room at bottom
    }
