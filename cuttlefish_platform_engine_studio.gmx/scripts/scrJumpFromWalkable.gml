// check if allowed to jump
// note that I didn't suppress the kJumpPressed input, because then have to suppress it in all enemy AI scripts, so easier here
if not ALLOW_ENEMY_JUMPING then 
    {
    if object_is_ancestor(id.object_index, objParentEnemy) then break ; // exit script
    }
if not ALLOW_PLAYER_JUMPING then
    {
    if object_index = objPlayer then break ; // exit script
    }
// only jump if space to do so
scrProcessIsBelow() ;
if character_is_below = NOTHING or character_is_below = LADDER then
    {
    vert_speed = INITIAL_JUMP ;
    state = JUMPING ;
    if AUTO_SOUND_PANNING then scrSoundPanSet(soundJump) ;
    scrSoundPlayOnlyInView(soundJump, 0) ;
    }
