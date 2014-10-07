player_score[global.current_player] += 100 ;
if ALLOW_POINTS_FADE then
    {
    points_fade_id = instance_create(x, y-30, objPointsFade) ;
    points_fade_id.points = 100 ;
    }
with other
    {
    instance_destroy() ;
    }
if instance_number(objParentFood) = 0 then // no food unlocks portal
    {
    with objParentPortal
        {
        unlocked = true ;
        }
    }
