// check for player character on side and if player input in pushing direction
if place_meeting(x-1, y, objPlayer) and objPlayer.kRight then // pushing from left
    {
    scrContactSolidRight(WALK_SPEED * MOVABLE_SPEED_FACTOR) ; // don't cover anything
    }
if place_meeting(x+1, y, objPlayer) and objPlayer.kLeft then // pushing from right
    {
    scrContactSolidLeft(WALK_SPEED * MOVABLE_SPEED_FACTOR) ; // don't cover anything
    }
