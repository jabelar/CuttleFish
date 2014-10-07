// for some dumb reason Game Maker requires an Alarm event in order for the alarms to count down
// even if no code is executed in the Alarm event.  Therefore, I find it easier to manually decrement all alarms
var i ;
for (i=0; i<12; i+=1)
    {
    alarm[i] -= 1 ;
    if alarm[i] < -1 then alarm[i] = -1 ;
    }
