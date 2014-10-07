// to be called from player object
switch global.player_character_type
    {
    case "Pokey":
        {
        // set gravity factor
        my_gravity_factor = 1 ;
        my_original_gravity_factor = my_gravity_factor ; // remember this in case gravity changes during game
        // convertibility on death
        convertible = false ; // indicates if converts to another type when dead, if true also need to set convert_type_death
        // map weapon objects and sprites
        invincible = false ;
        weapon_swinging = false ;
        current_weapon_type = PLAYER_WEAPON_NONE ;
        weapon_no_weapon_wield_sprite_index = sprBlank ;
        weapon_melee_object_index = objPlayerWeaponLightSaber ; // this is used when swinging 
        weapon_melee_wield_sprite_index = sprPokeyWeaponLightSaber ; // this is used to make the player look like they're holding the weapon
        weapon_projectile_object_index = objPlayerWeaponLaser ; // this what is actually shot out, like a bullet
        weapon_projectile_wield_sprite_index = sprPokeyWeaponLaser ; // this is used to make player look like they're holding the weapon
        weapon_bomb_object_index = objPlayerWeaponBomb ; // this is the actual bomb
        weapon_bomb_wield_sprite_index = sprBlank ; 
        weapon_fire_flower_object_index = objPlayerWeaponFireBall ; // this is thrown        
        weapon_fire_flower_wield_sprite_index = sprPokeyWeaponFireFlower ; // this is used to make player look like they're holding the weapon
        // map conversion types for power ups
        convert_type_fire_flower = "Fire Mario" ; // this is global.player_character_type value to change to
        convert_type_penguin = "Penguin Mario" ;
        convert_type_giant = "Giant Mario" ;
        convert_type_helicopter = "Helicopter Mario" ;
        // map sprites
        sprite_standing = sprPokeyStanding ;
        sprite_walking = sprPokeyWalking ;
        sprite_running = sprPokeyWalking ;
        sprite_jumping = sprPokeyJumping ;
        sprite_falling = sprPokeyJumping ;
        sprite_ducking = sprPokeyDucking ;
        sprite_climbing = sprPokeyStanding ;
        sprite_jumping_powered = sprPokeySuperJumpingPowered ;
        sprite_super_jumping = sprPokeyJumping ;
        sprite_double_jumping = sprPokeyJumping ;
        sprite_dying = sprPokeyDying ;
        sprite_shielding = sprPokeyShield ;
        sprite_wall_jumping = sprPokeyStanding ;     
        // map sounds
        sound_death = soundPacmanDie ;
        sound_falling = NONE ;
        break ;
        }
    case "Michael":
        {
        // set gravity factor
        my_gravity_factor = 1 ;
        my_original_gravity_factor = my_gravity_factor ; // remember this in case gravity changes during game
        // convertibility on death
        convertible = false ; // indicates if converts to another type when dead, if true also need to set convert_type_death
        // map weapon objects and sprites
        invincible = false ;
        weapon_swinging = false ;
        current_weapon_type = PLAYER_WEAPON_BOMB ;
        weapon_melee_object_index = objPlayerWeaponLightSaber ; // this is used when swinging 
        weapon_melee_wield_sprite_index = sprPokeyWeaponLightSaber ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_projectile_object_index = objPlayerWeaponLaser ; // this what is actually shot out, like a bullet
        weapon_projectile_wield_sprite_index = sprPokeyWeaponLaser ; // this is used to make Pokeyacter look like they're holding the weapon
        weapon_bomb_object_index = objPlayerWeaponBomb ; // this is the actual bomb
        weapon_bomb_wield_sprite_index = sprBlank ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_fire_flower_object_index = objPlayerWeaponFireBall ; // this is thrown        
        weapon_fire_flower_wield_sprite_index = sprPokeyWeaponFireFlower ; // this is used to make player look like they're holding the weapon
        // map conversion types for power ups
        convert_type_fire_flower = "Fire Mario" ; // this is global.player_character_type value to change to
        convert_type_penguin = "Penguin Mario" ;
        convert_type_giant = "Giant Mario" ;
        convert_type_helicopter = "Helicopter Mario" ;
        // map sprites
        sprite_standing = sprMichaelStanding ;
        sprite_walking = sprMichaelWalking ;
        sprite_running = sprMichaelWalking ;
        sprite_jumping = sprMichaelJumping ;
        sprite_falling = sprMichaelJumping ;
        sprite_ducking = sprMichaelDucking ;
        sprite_climbing = sprMichaelStanding ;
        sprite_jumping_powered = sprMichaelJumping ;
        sprite_super_jumping = sprMichaelJumping ;
        sprite_double_jumping = sprMichaelJumping ;
        sprite_dying = sprMichaelDying ;
        sprite_shielding = sprPokeyShield ;
        sprite_wall_jumping = sprMichaelStanding ;
        // map sounds
        sound_death = soundPacmanDie ;
        sound_falling = NONE ;
        break ;
        }
    case "Mario":
        {
        // set gravity factor
        my_gravity_factor = 1 ;
        my_original_gravity_factor = my_gravity_factor ; // remember this in case gravity changes during game
        // convertibility on death
        convertible = false ; // indicates if converts to another type when dead, if true also need to set convert_type_death
        // map weapon objects and sprites
        invincible = false ;
        weapon_swinging = false ;
        current_weapon_type = PLAYER_WEAPON_NONE ;
        weapon_melee_object_index = objPlayerWeaponLightSaber ; // this is used when swinging 
        weapon_melee_wield_sprite_index = sprPokeyWeaponLightSaber ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_projectile_object_index = objPlayerWeaponLaser ; // this what is actually shot out, like a bullet
        weapon_projectile_wield_sprite_index = sprPokeyWeaponLaser ; // this is used to make Pokeyacter look like they're holding the weapon
        weapon_bomb_object_index = objPlayerWeaponBomb ; // this is the actual bomb
        weapon_bomb_wield_sprite_index = sprBlank ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_fire_flower_object_index = objPlayerWeaponFireBall ; // this is thrown        
        weapon_fire_flower_wield_sprite_index = sprMarioWeaponFireFlower ; // this is used to make player look like they're holding the weapon
        // map conversion types for power ups
        convert_type_fire_flower = "Fire Mario" ; // this is global.player_character_type value to change to
        convert_type_penguin = "Penguin Mario" ;
        convert_type_giant = "Giant Mario" ;
        convert_type_helicopter = "Helicopter Mario" ;
        // map sprites
        sprite_standing = sprMarioStanding ;
        sprite_walking = sprMarioWalking ;
        sprite_running = sprMarioWalking ;
        sprite_jumping = sprMarioJumping ;
        sprite_falling = sprMarioJumping ;
        sprite_ducking = sprMarioDucking ;
        sprite_climbing = sprMarioClimbing ;
        sprite_jumping_powered = sprMarioJumping ;
        sprite_super_jumping = sprMarioJumping ;
        sprite_double_jumping = sprMarioJumping ;
        sprite_dying = sprMarioStanding ;
        sprite_shielding = sprPokeyShield ;
        sprite_wall_jumping = sprMarioStanding ;
        sprite_flying = sprMarioJumping ;
        // map sounds
        sound_death = soundSuperMarioDie ;
        sound_falling = NONE ;
        break ;
        }
    case "Penguin Mario":
        {
        // set gravity factor
        my_gravity_factor = 1 ;
        my_original_gravity_factor = my_gravity_factor ; // remember this in case gravity changes during game
        // convertibility on death
        convertible = false ; // indicates if converts to another type when dead, if true also need to set convert_type_death
        // map weapon objects and sprites
        invincible = false ;
        weapon_swinging = false ;
        current_weapon_type = PLAYER_WEAPON_FIRE_FLOWER ;
        weapon_melee_object_index = objPlayerWeaponLightSaber ; // this is used when swinging 
        weapon_melee_wield_sprite_index = sprPokeyWeaponLightSaber ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_projectile_object_index = objPlayerWeaponLaser ; // this what is actually shot out, like a bullet
        weapon_projectile_wield_sprite_index = sprPokeyWeaponLaser ; // this is used to make Pokeyacter look like they're holding the weapon
        weapon_bomb_object_index = objPlayerWeaponBomb ; // this is the actual bomb
        weapon_bomb_wield_sprite_index = sprBlank ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_fire_flower_object_index = objPlayerWeaponIceBall ; // this is thrown        
        weapon_fire_flower_wield_sprite_index = sprBlank ; // this is used to make player look like they're holding the weapon
        // map conversion types for power ups
        convert_type_fire_flower = "Fire Mario" ; // this is global.player_character_type value to change to
        convert_type_penguin = "Penguin Mario" ;
        convert_type_giant = "Giant Mario" ;
        convert_type_helicopter = "Helicopter Mario" ;
        // map sprites
        sprite_standing = sprPenguinMarioStanding ;
        sprite_walking = sprPenguinMarioWalking ;
        sprite_running = sprPenguinMarioWalking ;
        sprite_jumping = sprPenguinMarioJumping ;
        sprite_falling = sprPenguinMarioJumping ;
        sprite_ducking = sprMarioDucking ;
        sprite_climbing = sprPenguinMarioClimbing ;
        sprite_jumping_powered = sprPenguinMarioJumping ;
        sprite_super_jumping = sprPenguinMarioJumping ;
        sprite_double_jumping = sprPenguinMarioJumping ;
        sprite_dying = sprPenguinMarioStanding ;
        sprite_shielding = sprPokeyShield ;
        sprite_wall_jumping = sprPenguinMarioStanding ;
        sprite_flying = sprPenguinMarioJumping ;
        // map sounds
        sound_death = soundSuperMarioDie ;
        sound_falling = NONE ;
        break ;
        }
    case "Helicopter Mario":
        {
        // set gravity factor
        my_gravity_factor = 0.5 ;
        my_original_gravity_factor = my_gravity_factor ; // remember this in case gravity changes during game
        // convertibility on death
        convertible = false ; // indicates if converts to another type when dead, if true also need to set convert_type_death
        // map weapon objects and sprites
        invincible = false ;
        weapon_swinging = false ;
        current_weapon_type = PLAYER_WEAPON_NONE ;
        weapon_melee_object_index = objPlayerWeaponLightSaber ; // this is used when swinging 
        weapon_melee_wield_sprite_index = sprPokeyWeaponLightSaber ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_projectile_object_index = objPlayerWeaponLaser ; // this what is actually shot out, like a bullet
        weapon_projectile_wield_sprite_index = sprPokeyWeaponLaser ; // this is used to make Pokeyacter look like they're holding the weapon
        weapon_bomb_object_index = objPlayerWeaponBomb ; // this is the actual bomb
        weapon_bomb_wield_sprite_index = sprBlank ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_fire_flower_object_index = objPlayerWeaponFireBall ; // this is thrown        
        weapon_fire_flower_wield_sprite_index = sprMarioWeaponFireFlower ; // this is used to make player look like they're holding the weapon
        // map conversion types for power ups
        convert_type_fire_flower = "Fire Mario" ; // this is global.player_character_type value to change to
        convert_type_penguin = "Penguin Mario" ;
        convert_type_giant = "Giant Mario" ;
        convert_type_helicopter = "Helicopter Mario" ;
        // map sprites
        sprite_standing = sprHelicopterMarioStanding ;
        sprite_walking = sprHelicopterMarioWalking ;
        sprite_running = sprHelicopterMarioWalking ;
        sprite_jumping = sprHelicopterMarioJumping ;
        sprite_falling = sprHelicopterMarioJumping ;
        sprite_ducking = sprHelicopterMarioDucking ;
        sprite_climbing = sprHelicopterMarioClimbing ;
        sprite_jumping_powered = sprHelicopterMarioJumping ;
        sprite_super_jumping = sprHelicopterMarioJumping ;
        sprite_double_jumping = sprHelicopterMarioJumping ;
        sprite_dying = sprHelicopterMarioStanding ;
        sprite_shielding = sprPokeyShield ;
        sprite_wall_jumping = sprHelicopterMarioStanding ;
        sprite_flying = sprHelicopterMarioJumping ;
        // map sounds
        sound_death = soundSuperMarioDie ;
        sound_falling = NONE ;
        break ;
        }
    case "Giant Mario":
        {
        // set gravity factor
        my_gravity_factor = 1 ;
        my_original_gravity_factor = my_gravity_factor ; // remember this in case gravity changes during game
        // convertibility on death
        convertible = true ; // indicates if converts to another type when dead, if true also need to set convert_type_death
        convert_type_death = "Mario" ;
        // map weapon objects and sprites
        invincible = false ;
        weapon_swinging = false ;
        current_weapon_type = PLAYER_WEAPON_NONE ;
        weapon_melee_object_index = objPlayerWeaponLightSaber ; // this is used when swinging 
        weapon_melee_wield_sprite_index = sprPokeyWeaponLightSaber ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_projectile_object_index = objPlayerWeaponLaser ; // this what is actually shot out, like a bullet
        weapon_projectile_wield_sprite_index = sprPokeyWeaponLaser ; // this is used to make Pokeyacter look like they're holding the weapon
        weapon_bomb_object_index = objPlayerWeaponBomb ; // this is the actual bomb
        weapon_bomb_wield_sprite_index = sprBlank ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_fire_flower_object_index = objPlayerWeaponFireBall ; // this is thrown        
        weapon_fire_flower_wield_sprite_index = sprMarioWeaponFireFlower ; // this is used to make player look like they're holding the weapon
        // map conversion types for power ups
        convert_type_fire_flower = "Fire Mario" ; // this is global.player_character_type value to change to
        convert_type_penguin = "Penguin Mario" ;
        convert_type_giant = "Giant Mario" ;
        convert_type_helicopter = "Helicopter Mario" ;
        // map sprites
        sprite_standing = sprGiantMarioStanding ;
        sprite_walking = sprGiantMarioWalking ;
        sprite_running = sprGiantMarioWalking ;
        sprite_jumping = sprGiantMarioJumping ;
        sprite_falling = sprGiantMarioJumping ;
        sprite_ducking = sprGiantMarioDucking ;
        sprite_climbing = sprGiantMarioClimbing ;
        sprite_jumping_powered = sprGiantMarioJumping ;
        sprite_super_jumping = sprGiantMarioJumping ;
        sprite_double_jumping = sprGiantMarioJumping ;
        sprite_dying = sprGiantMarioStanding ;
        sprite_shielding = sprPokeyShield ;
        sprite_wall_jumping = sprGiantMarioStanding ;
        sprite_flying = sprGiantMarioJumping ;
        // map sounds
        sound_death = soundSuperMarioDie ;
        sound_falling = NONE ;
        break ;
        }
    case "Fire Mario":
        {
        // set gravity factor
        my_gravity_factor = 1 ;
        my_original_gravity_factor = my_gravity_factor ; // remember this in case gravity changes during game
        // convertibility on death
        convertible = false ; // indicates if converts to another type when dead, if true also need to set convert_type_death
        // map weapon objects and sprites
        invincible = false ;
        weapon_swinging = false ;
        current_weapon_type = PLAYER_WEAPON_FIRE_FLOWER ;
        weapon_melee_object_index = objPlayerWeaponLightSaber ; // this is used when swinging 
        weapon_melee_wield_sprite_index = sprPokeyWeaponLightSaber ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_projectile_object_index = objPlayerWeaponLaser ; // this what is actually shot out, like a bullet
        weapon_projectile_wield_sprite_index = sprPokeyWeaponLaser ; // this is used to make Pokeyacter look like they're holding the weapon
        weapon_bomb_object_index = objPlayerWeaponBomb ; // this is the actual bomb
        weapon_bomb_wield_sprite_index = sprBlank ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_fire_flower_object_index = objPlayerWeaponFireBall ; // this is thrown        
        weapon_fire_flower_wield_sprite_index = sprBlank ; // this is used to make player look like they're holding the weapon
        // map conversion types for power ups
        convert_type_fire_flower = "Fire Mario" ; // this is global.player_character_type value to change to
        convert_type_penguin = "Penguin Mario" ;
        convert_type_giant = "Giant Mario" ;
        convert_type_helicopter = "Helicopter Mario" ;
        // map sprites
        sprite_standing = sprMarioFireStanding ;
        sprite_walking = sprMarioFireWalking ;
        sprite_running = sprMarioFireWalking ;
        sprite_jumping = sprMarioFireJumping ;
        sprite_falling = sprMarioFireJumping ;
        sprite_ducking = sprMarioDucking ;
        sprite_climbing = sprMarioClimbing ;
        sprite_jumping_powered = sprMarioFireJumping ;
        sprite_super_jumping = sprMarioFireJumping ;
        sprite_double_jumping = sprMarioFireJumping ;
        sprite_dying = sprMarioFireStanding ;
        sprite_shielding = sprPokeyShield ;
        sprite_wall_jumping = sprMarioFireStanding ;
        sprite_flying = sprMarioFireJumping ;
        // map sounds
        sound_death = soundSuperMarioDie ;
        sound_falling = NONE ;
        break ;
        }
    case "LodeRunner":
        {
        // set gravity factor
        my_gravity_factor = 1 ;
        my_original_gravity_factor = my_gravity_factor ; // remember this in case gravity changes during game
        // convertibility on death
        convertible = false ; // indicates if converts to another type when dead, if true also need to set convert_type_death
        // map weapon objects and sprites
        invincible = false ;
        weapon_swinging = false ;
        current_weapon_type = PLAYER_WEAPON_NONE ;
        weapon_melee_object_index = objPlayerWeaponLightSaber ; // this is used when swinging 
        weapon_melee_wield_sprite_index = sprPokeyWeaponLightSaber ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_projectile_object_index = objPlayerWeaponLaser ; // this what is actually shot out, like a bullet
        weapon_projectile_wield_sprite_index = sprPokeyWeaponLaser ; // this is used to make Pokeyacter look like they're holding the weapon
        weapon_bomb_object_index = objPlayerWeaponBomb ; // this is the actual bomb
        weapon_bomb_wield_sprite_index = sprBlank ; // this is used to make the Pokeyacter look like they're holding the weapon
        weapon_fire_flower_object_index = objPlayerWeaponFireBall ; // this is thrown        
        weapon_fire_flower_wield_sprite_index = sprMarioWeaponFireFlower ; // this is used to make player look like they're holding the weapon
        // map conversion types for power ups
        convert_type_fire_flower = "Fire Mario" ; // this is global.player_character_type value to change to
        convert_type_penguin = "Penguin Mario" ;
        convert_type_giant = "Giant Mario" ;
        convert_type_helicopter = "Helicopter Mario" ;
        // map sprites
        sprite_standing = sprLodeRunnerStanding ;
        sprite_walking = sprLodeRunnerWalking ;
        sprite_running = sprLodeRunnerWalking ;
        sprite_jumping = sprLodeRunnerStanding ;
        sprite_falling = sprLodeRunnerFalling ;
        sprite_ducking = sprLodeRunnerStanding ;
        sprite_climbing = sprLodeRunnerClimbing ;
        sprite_jumping_powered = sprLodeRunnerStanding ;
        sprite_super_jumping = sprLodeRunnerStanding ;
        sprite_double_jumping = sprLodeRunnerStanding ;
        sprite_dying = sprLodeRunnerStanding ;
        sprite_shielding = sprPokeyShield ;
        sprite_wall_jumping = sprLodeRunnerStanding ;
        sprite_flying = sprLodeRunnerStanding ;
        // map sounds
        sound_death = soundStomp ;
        sound_falling = soundFalling ;
        break ;
        }
    case "Kangaroo":
        {
        // set gravity factor
        my_gravity_factor = 0.8 ;
        my_original_gravity_factor = my_gravity_factor ; // remember this in case gravity changes during game
        // convertibility on death
        convertible = false ; // indicates if converts to another type when dead, if true also need to set convert_type_death
        // map weapon objects and sprites
        invincible = false ;
        weapon_swinging = false ;
        current_weapon_type = PLAYER_WEAPON_NONE ;
        weapon_no_weapon_wield_sprite_index = sprBlank ;
        weapon_melee_object_index = objPlayerWeaponLightSaber ; // this is used when swinging 
        weapon_melee_wield_sprite_index = sprPokeyWeaponLightSaber ; // this is used to make the player look like they're holding the weapon
        weapon_projectile_object_index = objPlayerWeaponLaser ; // this what is actually shot out, like a bullet
        weapon_projectile_wield_sprite_index = sprPokeyWeaponLaser ; // this is used to make player look like they're holding the weapon
        weapon_bomb_object_index = objPlayerWeaponBomb ; // this is the actual bomb
        weapon_bomb_wield_sprite_index = sprBlank ; 
        weapon_fire_flower_object_index = objPlayerWeaponFireBall ; // this is thrown        
        weapon_fire_flower_wield_sprite_index = sprMarioWeaponFireFlower ; // this is used to make player look like they're holding the weapon
        // map conversion types for power ups
        convert_type_fire_flower = "Fire Mario" ; // this is global.player_character_type value to change to
        convert_type_penguin = "Penguin Mario" ;
        convert_type_giant = "Giant Mario" ;
        convert_type_helicopter = "Helicopter Mario" ;
        // map sprites
        sprite_standing = sprKangarooStanding ;
        sprite_walking = sprKangarooWalking ;
        sprite_running = sprKangarooWalking ;
        sprite_jumping = sprKangarooStanding ;
        sprite_falling = sprKangarooStanding ;
        sprite_ducking = sprKangarooStanding ;
        sprite_climbing = sprKangarooWalking ;
        sprite_jumping_powered = sprKangarooStanding ;
        sprite_super_jumping = sprKangarooStanding ;
        sprite_double_jumping = sprKangarooStanding ;
        sprite_dying = sprKangarooStanding ;
        sprite_shielding = sprPokeyShield ;
        sprite_wall_jumping = sprKangarooStanding ;
        sprite_flying = sprKangarooStanding ;
        // map sounds
        sound_death = soundPacmanDie ;
        sound_falling = NONE ;
        break ;
        }
    case "Type":
        {
        // set gravity factor
        my_gravity_factor = 1 ;
        my_original_gravity_factor = my_gravity_factor ; // remember this in case gravity changes during game
        // convertibility on death
        convertible = false ; // indicates if converts to another type when dead, if true also need to set convert_type_death
        // map weapon objects and sprites
        invincible = false ;
        weapon_swinging = false ;
        current_weapon_type = PLAYER_WEAPON_NONE ;
        weapon_no_weapon_wield_sprite_index = sprBlank ;
        weapon_melee_object_index = objPlayerWeaponLightSaber ; // this is used when swinging 
        weapon_melee_wield_sprite_index = sprPokeyWeaponLightSaber ; // this is used to make the player look like they're holding the weapon
        weapon_projectile_object_index = objPlayerWeaponLaser ; // this what is actually shot out, like a bullet
        weapon_projectile_wield_sprite_index = sprPokeyWeaponLaser ; // this is used to make player look like they're holding the weapon
        weapon_bomb_object_index = objPlayerWeaponBomb ; // this is the actual bomb
        weapon_bomb_wield_sprite_index = sprBlank ; 
        weapon_fire_flower_object_index = objPlayerWeaponIceBall ; // this is thrown        
        weapon_fire_flower_wield_sprite_index = sprTypeWeaponIceFlower ; // this is used to make player look like they're holding the weapon
        // map conversion types for power ups
        convert_type_fire_flower = "Fire Mario" ; // this is global.player_character_type value to change to
        convert_type_penguin = "Penguin Mario" ;
        convert_type_giant = "Giant Mario" ;
        convert_type_helicopter = "Helicopter Mario" ;
        // map sprite
        sprite_standing = sprTypeStand ;
        sprite_walking = sprTypeSlide ;
        sprite_running = sprTypeSlide ;
        sprite_jumping = sprTypeJump ;
        sprite_falling = sprTypeStand;
        sprite_ducking = sprTypeDuck ;
        sprite_climbing = sprTypeClimb ;
        sprite_jumping_powered = sprTypeJump ;
        sprite_super_jumping = sprTypeJump ;
        sprite_double_jumping = sprTypeJump ;
        sprite_dying = sprDead ;
        sprite_shielding = sprPokeyShield ;
        sprite_wall_jumping = sprTypeStand ;
        sprite_flying = sprTypeJump ;
        // map sounds
        sound_death = soundPacmanDie ;
        sound_falling = NONE ;
        break ;
        }
    }
