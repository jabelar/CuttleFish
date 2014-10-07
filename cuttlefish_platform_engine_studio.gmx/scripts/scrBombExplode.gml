// this alarm should change bomb into bomb explosion
// make explosion sound
if AUTO_SOUND_PANNING then scrSoundPanSet(soundExplosion) ;
sound_play(soundExplosion) ;
// create one explosion on center of bomb
explosion_id = instance_create(x, y, objBombExplosion) ;
explosion_id.range_remaining = 0 ; // center bomb explosion doesn't propagate
explosion_id.propagate_x = 0 ;
explosion_id.propagate_y = 0 ;
// and create a chain reaction if room and range
    // on right
    propagate_x = sprite_width ;
    propagate_y = 0 ;
    scrProcessPlayerBombChainReaction() ;
    // on left
    propagate_x = -sprite_width ;
    propagate_y = 0 ;
    scrProcessPlayerBombChainReaction() ;
    // on top
    propagate_x = 0 ;
    propagate_y = -sprite_height ;
    scrProcessPlayerBombChainReaction() ;
    // on bottom
    propagate_x = 0 ;
    propagate_y = sprite_height ;
    scrProcessPlayerBombChainReaction() ;
    // on right-top
    propagate_x = sprite_width ;
    propagate_y = -sprite_height ;
    scrProcessPlayerBombChainReaction() ;
    // on left-top
    propagate_x = -sprite_width ;
    propagate_y = -sprite_height ;
    scrProcessPlayerBombChainReaction() ;
    // on right-bottom
    propagate_x = sprite_width ;
    propagate_y = sprite_height ;
    scrProcessPlayerBombChainReaction() ;
    // on left-bottom
    propagate_x = -sprite_width ;
    propagate_y = sprite_height ;
    scrProcessPlayerBombChainReaction() ;
// destroy self
instance_destroy() ;
