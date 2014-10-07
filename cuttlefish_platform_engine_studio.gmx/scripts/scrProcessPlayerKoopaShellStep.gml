// created_by_id is assigned by the enemy weapon koopa shell that creates this object
// if not object_exists(created_by_id) then instance_destroy() ; // destroy if for some reason creator is destroyed

// no sprite, since this is intended to be an invisible tracking object

// check for collisions with enemies
enemy_id = instance_place(x, y, objParentEnemy) ;
if enemy_id > 0 then // enemy hit
    {
    if enemy_id.state != DYING then // don't count hits on enemies already dying
        {
        with (enemy_id)
            {
            scrKillEnemy() ;
            }
        }
    }
    
// check for collisions with turrets
obstacle_id = instance_place(x, y, objParentTurret) ;
if obstacle_id > 0 and ALLOW_PLAYER_WEAPON_KILL_TURRETS then // obstacle hit and allowed to kill
    {
    with (obstacle_id)
        {
        scrKillTurret() ;
        }
    }
    
// check for collisions with breakables
// don't need to process because tracking an enemy object which will do the breaking
    
// otherwise track creator
x = created_by_id.x ;
y = created_by_id.y ;

// check for outside room
if x < 0 or y < 0 or x > room_width or y > room_height then
    {
    instance_destroy() ; // destroy after it leaves room
    }
