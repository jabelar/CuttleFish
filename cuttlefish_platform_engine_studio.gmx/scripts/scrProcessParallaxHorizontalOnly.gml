if not ALLOW_TERRAIN_PARALLAX then break ;

// intended to be called from Step event of a view or parallax controller object
// terrain objects will move slower (or faster) than view depending on depth, with depth = 0 considered no parallax point
// argument 0 is the view number that is parallaxing
view_move_x = view_xview[argument0]-previous_xview[argument0] ;
// now adjust all terrain by slowing down versus (moving back against) the view movement
with objParentTerrainParallax
    {
    parallax_factor = 0.5+(depth - 100000)/200000 ; // 100000 is max depth, will be 0 at depth = 0, 1 at depth 100000 and 3 at depth -100000
    x += 2* other.view_move_x * parallax_factor ;
    }

// remember view position to help determine movement next step
previous_xview[argument0] = view_xview[argument0] ;
