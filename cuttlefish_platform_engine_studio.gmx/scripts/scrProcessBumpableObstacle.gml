if objPlayer.state != FALLING then break ; // exit script
if place_meeting(x, y+1, objPlayer) then scrBumpBumpable() ;
