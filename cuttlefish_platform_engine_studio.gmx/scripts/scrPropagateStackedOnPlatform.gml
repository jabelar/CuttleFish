// this is intended to be run from platform object
// for every object with a valid platform_id propagate platform_id to anything stacked on it
// but have to do recursively for indefinitely tall stacks
// but instead of recursion, can just repeat the max possible number (based on existing object count)
max_stack = instance_number(objParentEnemy)+ instance_number(objParentCompanion) + instance_number(objParentPlayerBomb) + instance_number(objParentMovableObstacle) + 1 // the "1" is for player object
for (i = 0; i < max_stack; i += 1)
    {
    with (all)
        {
        sitting_on_id = instance_place(x, y+1, all) ;
        if sitting_on_id >= 0 then // must be sitting on top of something
            {
            with (sitting_on_id)
                {            
                if variable_local_exists("platform_id") then // must be type of object that can be affected by platforms
                    {
                    if platform_id >= 0 then // object is affected by a platform
                        {
                        other.platform_id = platform_id ; // propagate platform effect
                        } 
                    }
                }
            }
        }
    }
