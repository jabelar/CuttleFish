if not invincible then
    {
    if convertible then // convert to different player character type instead of die
        {
        global.player_character_type = convert_type_death ;
        scrMapPlayerCharacter() ;
        scrGetUnstuck() ; // size of bounding box might be different, so make sure not stuck
        }
    else
        {
        global.number_of_lives[global.current_player] -= 1 ;
        state = DYING ; // character dies
        if AUTO_SOUND_PANNING then scrSoundPanSet(sound_death) ;
        sound_play(sound_death) ;
        }
    }
