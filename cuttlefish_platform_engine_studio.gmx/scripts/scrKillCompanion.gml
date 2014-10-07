state = DYING ;
if not sound_isplaying(sound_death) then 
    {
    if AUTO_SOUND_PANNING then scrSoundPanSet(sound_death) ;
    sound_play(sound_death) ;
    }
