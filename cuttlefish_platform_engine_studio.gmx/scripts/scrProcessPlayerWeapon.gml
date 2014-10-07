// cannot use weapon if ducking
if state = DUCKING then break ; // exit script

// process based on weapon type
switch current_weapon_type
    {
    case PLAYER_WEAPON_LASER:
        {
        if ALLOW_PLAYER_MULTIPLE_BULLETS then
            {
            bullet_id = instance_create(x, y, weapon_projectile_object_index) ;
            bullet_id.facing = facing ; // shoot in direction character is facing
            }
        else // only create one at a time
            {
            if not instance_exists(objParentPlayerWeapon) then // okay to shoot
                {
                bullet_id = instance_create(x, y, weapon_projectile_object_index) ;
                bullet_id.facing = facing ; // shoot in direction character is facing
                }
            }
        break ;
        }
    case PLAYER_WEAPON_BOMB:
        {
        if ALLOW_PLAYER_MULTIPLE_BULLETS then
            {
            bomb_id = instance_create(x, y, weapon_bomb_object_index) ;
            bomb_id.state = STANDING ; // will obey physics
            }
        else // only create one at a time
            {
            if not instance_exists(objParentPlayerWeapon) then // okay to plant bomb
                {
                bomb_id = instance_create(x, y, weapon_bomb_object_index) ;
                bomb_id.state = STANDING ; // will obey physics
                }
            }
        break ;
        }
    case PLAYER_WEAPON_SWORD:
        {
        // swing weapon if not already swinging
        if not weapon_swinging then
            {
            if AUTO_SOUND_PANNING then scrSoundPanSet(soundLightSaber) ;
            sound_play(soundLightSaber) ;
            sword_id = instance_create(x, y, weapon_melee_object_index) ;
            sword_id.wielder_id = id ; // let sword object know who is holding it
            sword_id.depth = depth - 1 ; // make sure visible over player object
            if kUp then sword_id.image_angle = 90 ; // allow swing above head
            if kDown then sword_id.image_angle = 270 ; // allow swing below
            weapon_swinging = true ;
            }
        break ;
        }
    case PLAYER_WEAPON_FIRE_FLOWER:
        {
        // only create if space to do so
        if (facing = LEFT and not character_is_right_of = SOLID) or (facing = RIGHT and not character_is_left_of = SOLID) then
            {
            // lob fireball in direction facing
            if ALLOW_PLAYER_MULTIPLE_BULLETS then
                {
                    {
                    fireball_id = instance_create(x, y, weapon_fire_flower_object_index) ;
                    fireball_id.facing = facing ; // shoot in direction character is facing
                    }
                }
            else // only create one at a time
                {
                if not instance_exists(objParentPlayerWeapon) then // okay to shoot
                    {
                    fireball_id = instance_create(x, y, weapon_fire_flower_object_index) ;
                    fireball_id.facing = facing ; // shoot in direction character is facing
                    }
                }
            }
        break ;
        }
    }
        
        
