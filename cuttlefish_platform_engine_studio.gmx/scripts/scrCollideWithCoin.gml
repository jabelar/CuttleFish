// to be called from objPlayer
global.player_score[global.current_player] += other.worth ;
if ALLOW_POINTS_FADE then
    {
    points_fade_id = instance_create(x, y-30, objPointsFade) ;
    points_fade_id.points = other.worth ;
    }
global.coins_collected[global.current_player] += 1 ;
if AUTO_SOUND_PANNING then scrSoundPanSet(soundCoin) ;
sound_play(soundCoin) ;
with other
    {
    scrEffectStars(x+sprite_width/2, y+sprite_height/2, 3, 16) ;
    instance_destroy() ;
    }
