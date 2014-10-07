// to be called within enemy object after collision with weapon or hazard
global.player_score[global.current_player] += worth ;
if AUTO_SOUND_PANNING then scrSoundPanSet(sound_death) ;
scrSoundPlayOnlyInView(sound_death) ;
if ALLOW_POINTS_FADE then
    {
    points_fade_id = instance_create(x, y-30, objPointsFade) ;
    points_fade_id.points = worth ;
    }
instance_change(freeze_object_index, true) ;
