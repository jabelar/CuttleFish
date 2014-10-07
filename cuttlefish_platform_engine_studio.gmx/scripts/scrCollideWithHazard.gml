// die if not already dying
if state != DYING then
    {
    // everything dies in hazard
    // process according to what it is that has collided
    if object_index = objPlayer then scrKillPlayer() ;
    else if object_is_ancestor(id.object_index, objParentEnemy) then scrKillEnemy() ;
    else scrKillCompanion() ; // must be companion if not player or enemy
    }

