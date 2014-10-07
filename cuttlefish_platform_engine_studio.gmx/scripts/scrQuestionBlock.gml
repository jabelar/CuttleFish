// this should be called within an question block object

// exit if still processing previous bump
if bumped then break ;

// create delay until next bump to avoid release of multiple items on one hit
bumped = true ;
alarm[3] = BUMP_DELAY ; // set to number of steps before unbumping

// visual effect of bump will be done in Draw event
// do not want to actually move obstacle because will create potential for things getting stuck.
