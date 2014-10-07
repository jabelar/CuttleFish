scrProcessSurroundings() ;
// dig if there is something to dig
if kDigLeftPressed and diggable_left_id != noone then
    {
    with (diggable_left_id)
        {
        if refillable then
            {
            // need marker because characters can fall through while enemies can't
            marker_id = instance_create(x, y, objRefillMarker) ;
            marker_id.refill_object_index = refill_object_index ;
            marker_id.original_object_index = object_index ;
            marker_id.alarm[0] = room_speed * DIGGABLE_REFILL_DELAY ;
            }
        instance_destroy() ;
        }
    }
if kDigRightPressed and diggable_right_id != noone then
    {
    with (diggable_right_id)
        {
        if refillable then
            {
            // need marker because characters can fall through while enemies can't
            marker_id = instance_create(x, y, objRefillMarker) ;
            marker_id.refill_object_index = refill_object_index ;
            marker_id.original_object_index = object_index ;
            marker_id.alarm[0] = room_speed * DIGGABLE_REFILL_DELAY ;
            }
        instance_destroy() ;
        }
    }
