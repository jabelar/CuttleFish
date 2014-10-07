// assign a global var for cases where other values not assigned
globalvar NONE ;

// global vars for ordered list of players
globalvar PLAYER1, PLAYER2 ;

// assign game style switching constants
globalvar GAME_STYLE_MARIO, GAME_STYLE_LODE_RUNNER, GAME_STYLE_SONIC, GAME_STYLE_GENERAL ;
globalvar GAME_STYLE_MENU ;

// assign input mapping constants
globalvar KEYBOARD, JOYSTICK, DPAD ;
globalvar INPUT_LEFT, INPUT_RIGHT, INPUT_UP, INPUT_DOWN ;
globalvar INPUT_JUMP, INPUT_SHOOT, INPUT_SWITCH_WEAPON ;
globalvar INPUT_SHIELD, INPUT_DIG_LEFT, INPUT_DIG_RIGHT ;
globalvar JOYSTICK_UP_FOR_JUMP, JOYSTICK_SENSITIVITY ; // 0 is highly sensitive, 1 is least sensitive

        // level reset behavior
        globalvar RESTART_LEVEL_ON_DEATH ;
        
        // allow room speed to be adjusted
        globalvar ROOM_SPEED ;
        
        // auto sound panning
        globalvar AUTO_SOUND_PANNING ;
        
        // terrain parallax
        globalvar ALLOW_TERRAIN_PARALLAX ;
        
        // particles and effects
        globalvar ALLOW_PARTICLE_EFFECTS, ALLOW_POINTS_FADE, POINTS_FADE_DELAY ;
    
        // assign global "constants"
        // moving object and character state constants
        globalvar STANDING, JUMPING, SHIELDING, WALKING, DYING, FALLING, RUNNING, DUCKING, FLYING, ATTACKING, CLIMBING ;
        globalvar SUPER_JUMPING, DOUBLE_JUMPING, STOPPED_IN_AIR, TRAPPED, WALL_JUMPING ;
    
        // facing state "constants"
        globalvar LEFT, RIGHT ;
    
        // speed and movement related "constants"
        globalvar ALLOW_PLAYER_JUMPING, ALLOW_ENEMY_JUMPING ;
        globalvar ENEMY_SPEED_FACTOR, WALK_SPEED, RUN_SPEED, FLY_SPEED, CLIMB_SPEED, JUMP_SPEED ;
        globalvar PLATFORM_SPEED, CONVEYOR_SPEED, CURRENT_SPEED, MOVABLE_SPEED_FACTOR ;
        globalvar INITIAL_JUMP, INITIAL_SUPER_JUMP, INITIAL_DOUBLE_JUMP, INITIAL_SQUASH_BOUNCE ;
        globalvar INITIAL_FIRE_FLOWER_BOUNCE, MAX_FALL_SPEED, GRAV, ALLOW_RUNNING ;
        globalvar RUN_DELAY, ALLOW_SONIC_TRAIL_EFFECT, TRAIL_SIZE, ALLOW_MOVE_WHILE_JUMP ;
        globalvar ALLOW_SUPER_BOUNCE, ALLOW_DOUBLE_JUMP, DOUBLE_JUMP_ZONE, ALLOW_PARACHUTE ;
        globalvar ALLOW_JUMP_THROUGH, ALLOW_WALL_JUMP, WALL_JUMP_DELAY, WALL_JUMP_ZONE ;
        globalvar ALLOW_EXTENDED_JUMP ;
    
        // surrounding state "constants"
        globalvar NOTHING, SOLID, LADDER, SLOPE_RIGHT, SLOPE_LEFT ;
    
        // artificial intelligence "constants"
        globalvar ENEMY_DECISION_FREQ, ENEMY_AI_DUMB_PREDICTABLE, ENEMY_AI_DUMB_RANDOM ;
        globalvar ENEMY_AI_HOMING, ENEMY_AI_FLYING_PREDICTABLE, ENEMY_AI_FLYING_RANDOM ;
        globalvar ENEMY_AI_FLYING_HOMING, HOMING_DEAD_ZONE ;
        globalvar ALLOW_ENEMY_RESPAWN, ENEMY_RESPAWN_DELAY, ENEMY_RESPAWN_SAFETY_DELAY ;
        globalvar ALLOW_ENEMY_OVERLAP ; // this is whether enemies can go on top of each other or pass through each other
    
        // weapon and battle "constants"
        globalvar ALLOW_PLAYER_JUMPING, ALLOW_ENEMY_JUMPING ;
        globalvar ALLOW_SHIELD, ALLOW_PLAYER_WEAPON, ALLOW_ENEMY_WEAPON, PLAYER_WEAPON_NONE ;
        globalvar PLAYER_WEAPON_LASER, PLAYER_WEAPON_BOMB, PLAYER_WEAPON_SWORD ;
        globalvar PLAYER_WEAPON_KOOPA_SHELL, PLAYER_WEAPON_FIRE_FLOWER, ALLOW_PLAYER_MULTIPLE_BULLETS ;
        globalvar BULLET_PERSIST, PLAYER_WEAPON_INTERVAL, ENEMY_WEAPON_DELAY, PLAYER_BOMB_DELAY ;
        globalvar PLAYER_BOMB_RANGE, PLAYER_BULLET_SPEED, ENEMY_BULLET_SPEED, ALLOW_PLAYER_WEAPON_BREAK_BREAKABLES ;
        globalvar ALLOW_PLAYER_WEAPON_KILL_TURRETS, ALLOW_PLAYER_MELEE_KILL_ENEMY_WEAPONS, ALLOW_BOMB_KILL_FRIENDLY ;
        globalvar ALLOW_ENEMY_WEAPON_BREAK_BREAKABLES, ALLOW_DIGGING, DIGGABLE_REFILL_DELAY, REFILL_ESCAPE_DELAY ;
        globalvar ALLOW_FIRE_FLOWER_DESTROYED_ON_HIT ;
        
        // companion "constants"
        globalvar COMPANION_DECISION_FREQ, MAX_COMPANION_LAG, COMPANION_SENSE_RANGE ;
        globalvar COMPANION_CLOSENESS_LIMIT ;
        
        // bumpable obstacle "constants"
        globalvar BUMP_DELAY, BUMP_AMOUNT ;
        
        // falling obstacle "constants"
        globalvar FALLING_OBSTACLE_DELAY ;
        
