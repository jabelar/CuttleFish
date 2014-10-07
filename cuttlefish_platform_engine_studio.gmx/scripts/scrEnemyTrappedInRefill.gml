// intended to be called from trapped object version of enemy
// change back to original
original_id = instance_create(x, y, original_object_index) ;
if ALLOW_ENEMY_RESPAWN then original_id.respawn_id = respawn_id ; // remember respawn marker if any
with (original_id)
    {
    scrKillEnemy() ;
    }
// destroy the trapped object
instance_destroy() ;
