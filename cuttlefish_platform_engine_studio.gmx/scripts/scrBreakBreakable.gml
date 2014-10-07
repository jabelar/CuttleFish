// this should be called within an breakable object

// movables may or may not be breakable, so check
if object_is_ancestor(id.object_index, objParentMovableObstacle) then
    {
    if not breakable then break ; // exit if not breakable
    }

// some breakables take more than one hit, based on animated deterioration
image_index += 1 ; // next step in animation
if image_index = image_number then // passed end of animation so destroy
    {
    sound_play(sound_death) ;
    if ALLOW_PARTICLE_EFFECTS then effect_create_below( ef_explosion, x+sprite_width/2, y+sprite_height/2, 0, dust_color) ;
    // check if treasure inside
    if contains_treasure then
        {
        instance_create(x, y, treasure_object_index) ;
        }
    instance_destroy() ;
    }
if AUTO_SOUND_PANNING then scrSoundPanSet(sound_death) ;
sound_play(sound_death) ; // play sound on every hit

