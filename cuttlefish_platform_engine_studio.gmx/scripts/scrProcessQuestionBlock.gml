if objPlayer.state != FALLING then break ; // exit script
if bumped then break ; // exit if still in delay period since last bump
if place_meeting(x, y+1, objPlayer) then // hit from below
    {
    if empty then
        {
        // do nothing
        }
    else
        {
        // create delay until next bump to avoid release of multiple items on one hit
        bumped = true ;
        alarm[3] = 10 ; // set to number of steps before unbumping
        if AUTO_SOUND_PANNING then scrSoundPanSet(soundBoink) ;
        sound_play(soundBoink) ;
        treasure_number = treasure_number - 1 ;
        if treasure_number < 1 then
            {
            empty = true ;
            sprite_index = empty_sprite_index ;
            }
        treasure_id = instance_create(x, y, treasure_object) ;
        with (treasure_id)
            {
            move_outside_solid(90, other.sprite_height) ; // move to top of question block
            }
        }
    }

// visual effect of bump will be done in Draw event
// do not want to actually move obstacle because will create potential for things getting stuck.
