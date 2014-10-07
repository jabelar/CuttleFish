// create catch up blur effect
// need to do this before moving as use current position as starting point
// check if location on left, right, top or bottom of player is free
// assumes companion sprite is same size as player sprite
if place_free(objPlayer.x - abs(sprite_width), objPlayer.y) then
    {
    catchup_x = objPlayer.x - abs(sprite_width) ;
    catchup_y = objPlayer.y ;
    }
else if place_free(objPlayer.x + abs(sprite_width), objPlayer.y) then 
    {
    catchup_x = objPlayer.x + abs(sprite_width) ;
    catchup_y = objPlayer.y ;
    }    
else if place_free(objPlayer.x, objPlayer.y + abs(sprite_height)) then 
    {
    catchup_x = objPlayer.x ;
    catchup_y = objPlayer.y + abs(sprite_height);
    }    
else if place_free(objPlayer.x, objPlayer.y - abs(sprite_height)) then 
    {
    catchup_x = objPlayer.x ;
    catchup_y = objPlayer.y - abs(sprite_height);
    }    
else // put on top if can't put on side
    {
    catchup_x = objPlayer.x ;
    catchup_y = objPlayer.y ;
    }

// create swooshing effect as series of rings
x_difference = catchup_x - x ;
y_difference = catchup_y - y ;
for (i=1; i<=10; i+=1)
    {
    effect_create_below(ef_ring, x+x_difference/10*i, y+y_difference/10*i, 0, c_fuchsia) ;
    }
    
// move to end of character trail, which presumably is a valid position
x = catchup_x ;
y = catchup_y ;

// update other pertinent state variables
if state != DUCKING and state != DYING then state = objPlayer.state else state = STANDING ;
parachute_deployed = objPlayer.parachute_deployed ;
bounce = objPlayer.bounce ;
facing = objPlayer.facing ;
scrInitializeInputVariables() ; // no AI input this step

