// call within turret object
if AUTO_SOUND_PANNING then scrSoundPanSet(sound_death) ;
scrSoundPlayOnlyInView(sound_death, 0) ;
global.player_score[global.current_player] += worth ;
if ALLOW_PARTICLE_EFFECTS then effect_create_below(ef_explosion, x+sprite_width/2, y+sprite_height/2, 0, dust_color) ;
if ALLOW_POINTS_FADE then
    {
    points_fade_id = instance_create(x, y-30, objPointsFade) ;
    points_fade_id.points = worth ;
    }
instance_destroy() ;
