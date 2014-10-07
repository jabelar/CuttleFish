// this updates some state variables depending on current situation character is in
// this primarily looks for things that affect response to player input, such as obstacle in the way
// other special obstacles such as platforms, conveyors and currents that affect physics are
// processed in step events.

scrProcessIsOver() ;
scrProcessIsAbove() ;
scrProcessIsBelow() ;
scrProcessIsRightOf() ;
scrProcessIsLeftOf() ;
if ALLOW_DIGGING then scrIdentifyDiggables() ;
