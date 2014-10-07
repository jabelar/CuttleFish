// this should be called within an bumpable object

// exit if still processing previous bump
if bumped then break ;

// kill any enemies above
with (objParentEnemy)
    {
    if place_meeting(x, y+1, other.id) then // right above bumpable so die
        {
        scrKillEnemy() ;
        }
    }

// create bump effect
bumped = true ;
alarm[3] = BUMP_DELAY ; // set to number of steps before unbumping

// visual effect of bump will be done in Draw event
// do not want to actually move obstacle because will create potential for things getting stuck.
