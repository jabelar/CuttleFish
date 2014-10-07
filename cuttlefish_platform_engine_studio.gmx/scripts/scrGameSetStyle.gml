// intended to be called from the game controller
// expects that globalvars were all previously declared (i.e. by scrDeclareGlobals())
switch argument0
    {
    case GAME_STYLE_MARIO:
        {
        // Super Mario style
        global.coins_collected = 0 ;
        global.level = 1 ;
        global.score_before_level = score ; // used to reset score when level restarted
        global.coins_collected_before_level = global.coins_collected ; // used to reset coins count when level restarted
        global.entered_by_portal = false ;
        global.initial_room_time = 3 * 60 * ROOM_SPEED ;
        global.room_time = global.initial_room_time ;
        global.room_minutes = 0 ;
        global.room_seconds = 0 ;
        global.room_time_expired = false ;
        global.room_time_warning = false ;
        global.room_time_warning_threshold = 30 * ROOM_SPEED ; // warning at 30 seconds left
        
        // background and intro music control
        global.background_music = soundBackgroundSuperMarioBros ;
        global.background_music_loop = true ;
    
        // level reset behavior
        RESTART_LEVEL_ON_DEATH = true ;
        
        // allow room speed to be adjusted
        ROOM_SPEED = 60 ;
        
        // joystick settings (only in effect if joystick enabled
        JOYSTICK_SENSITIVITY = 0.4 ;
        JOYSTICK_UP_FOR_JUMP = true ; // can press up for jumping
        
        // allow auto sound panning
        AUTO_SOUND_PANNING = true ;
        
        // terrain parallax
        ALLOW_TERRAIN_PARALLAX = true ; // affects all objects with parent objParentTerrain
        
        // particles and effects
        ALLOW_PARTICLE_EFFECTS = true ;
        ALLOW_POINTS_FADE = true ;
        POINTS_FADE_DELAY = 1.5 ; // in seconds
        
        // speed and movement related "constants"
        ALLOW_PLAYER_JUMPING = true ;
        ALLOW_ENEMY_JUMPING = false ;
        ENEMY_SPEED_FACTOR = 0.5 ;
        WALK_SPEED = 6 ;
        RUN_SPEED = 12 ;
        FLY_SPEED = 12 ;
        CLIMB_SPEED = 3 ;
        JUMP_SPEED = 8 ; // only used by treasure coins right now
        PLATFORM_SPEED = 3 ;
        CONVEYOR_SPEED = 2 ;
        CURRENT_SPEED = 4 ;
        MOVABLE_SPEED_FACTOR = 0.5 ;
        INITIAL_JUMP = -16 ;
        INITIAL_SUPER_JUMP = -22 ;
        INITIAL_DOUBLE_JUMP = -14 ;
        INITIAL_SQUASH_BOUNCE = -8 ;
        INITIAL_FIRE_FLOWER_BOUNCE = -8 ;
        MAX_FALL_SPEED = 14 ;
        GRAV = 0.9 ;
        ALLOW_RUNNING = false ;
        RUN_DELAY = 1 ; // in seconds
        ALLOW_SONIC_TRAIL_EFFECT = false ;
        TRAIL_SIZE = 6 ;
        ALLOW_MOVE_WHILE_JUMP = true ;
        ALLOW_SUPER_BOUNCE = false ;
        ALLOW_DOUBLE_JUMP = false ;
        DOUBLE_JUMP_ZONE = 8
        ALLOW_PARACHUTE = false ;
        ALLOW_JUMP_THROUGH = true ;
        ALLOW_WALL_JUMP = false ;
        WALL_JUMP_DELAY = 0.4 ; // in seconds
        WALL_JUMP_ZONE = 14 ; // this controls how close (speed wise) to the top of the jump before wall jumping allows
        ALLOW_EXTENDED_JUMP = true ;
        
        // artificial intelligence "constants"
        ENEMY_DECISION_FREQ = 3 ; // number of seconds between enemy AI decisions
        HOMING_DEAD_ZONE = 4 ;
        ALLOW_ENEMY_RESPAWN = false ;
        ENEMY_RESPAWN_DELAY = 1 * ROOM_SPEED ; // 1 seconds
        ENEMY_RESPAWN_SAFETY_DELAY = 0/5 * ROOM_SPEED; // 0.5 seconds
        ALLOW_ENEMY_OVERLAP = true ;
    
        // weapon and battle "constants"
        ALLOW_PLAYER_JUMPING = true ;
        ALLOW_ENEMY_JUMPING = true ;
        ALLOW_SHIELD = true ;
        ALLOW_PLAYER_WEAPON = true ;
        ALLOW_ENEMY_WEAPON = true ;
        ALLOW_PLAYER_MULTIPLE_BULLETS = true ;
        BULLET_PERSIST = 1 ;
        PLAYER_WEAPON_INTERVAL = 1 ; // in seconds
        ENEMY_WEAPON_DELAY = 4 ; // in seconds
        PLAYER_BOMB_DELAY = 3 ; // in seconds
        PLAYER_BOMB_RANGE = 3 ;
        PLAYER_BULLET_SPEED = 16 ;
        ENEMY_BULLET_SPEED = 16 ;
        ALLOW_PLAYER_WEAPON_BREAK_BREAKABLES = true ;
        ALLOW_PLAYER_WEAPON_KILL_TURRETS = true ;
        ALLOW_PLAYER_MELEE_KILL_ENEMY_WEAPONS = true ;
        ALLOW_BOMB_KILL_FRIENDLY = true ;
        ALLOW_ENEMY_WEAPON_BREAK_BREAKABLES = true ;
        ALLOW_DIGGING = true ;
        DIGGABLE_REFILL_DELAY = 4 ; // in seconds
        REFILL_ESCAPE_DELAY = 2 ; // in seconds
        ALLOW_FIRE_FLOWER_DESTROYED_ON_HIT = false ;
        
        // companion "constants"
        COMPANION_DECISION_FREQ = 0.5 ; // in seconds
        MAX_COMPANION_LAG = 400 ; // in pixels
        COMPANION_SENSE_RANGE = 200 ; // in pixels
        COMPANION_CLOSENESS_LIMIT = 32 ; // in pixels
        
        // bumpable obstacle "constants"
        BUMP_DELAY = 6 ; // in steps
        BUMP_AMOUNT = 4 ; // in pixels
        
        // falling obstacle "constants"
        FALLING_OBSTACLE_DELAY = 3 ; // in seconds
        
        break;
        }
    case GAME_STYLE_LODE_RUNNER:
        {
        // Lode Runner style
        global.coins_collected = 0 ;
        global.level = 1 ;
        global.score_before_level = score ; // used to reset score when level restarted
        global.coins_collected_before_level = global.coins_collected ; // used to reset coins count when level restarted
        global.entered_by_portal = false ;
        global.initial_room_time = 3 * 60 * ROOM_SPEED ;
        global.room_time = global.initial_room_time ;
        global.room_minutes = 0 ;
        global.room_seconds = 0 ;
        global.room_time_expired = false ;
        global.room_time_warning = false ;
        global.room_time_warning_threshold = 30 * ROOM_SPEED ; // warning at 30 seconds left

        // background and intro music control
        global.background_music = soundCommandoTheme ;
        global.background_music_loop = true ;
        
        // level reset behavior
        RESTART_LEVEL_ON_DEATH = true ;
        
        // allow room speed to be adjusted
        ROOM_SPEED = 30 ;

        // joystick settings (only in effect if joystick enabled
        JOYSTICK_SENSITIVITY = 0.75 ;
        JOYSTICK_UP_FOR_JUMP = false ; // can press up for jumping
                
        // allow auto sound panning
        AUTO_SOUND_PANNING = true ;
        
        // terrain parallax
        ALLOW_TERRAIN_PARALLAX = true ; // affects all objects with parent objParentTerrain
        
        // particles and effects
        ALLOW_PARTICLE_EFFECTS = false ;
        ALLOW_POINTS_FADE = false ;
        POINTS_FADE_DELAY = 1.5 ; // in seconds
        
        // speed and movement related "constants"
        ALLOW_PLAYER_JUMPING = false ;
        ALLOW_ENEMY_JUMPING = false ;
        ENEMY_SPEED_FACTOR = 0.5 ;
        WALK_SPEED = 6 ;
        RUN_SPEED = 12 ;
        FLY_SPEED = 12 ;
        CLIMB_SPEED = 3 ;
        JUMP_SPEED = 8 ; // only used by treasure coins right now
        PLATFORM_SPEED = 3 ;
        CONVEYOR_SPEED = 2 ;
        CURRENT_SPEED = 4 ;
        MOVABLE_SPEED_FACTOR = 0.5 ;
        INITIAL_JUMP = -16 ;
        INITIAL_SUPER_JUMP = -22 ;
        INITIAL_DOUBLE_JUMP = -14 ;
        INITIAL_SQUASH_BOUNCE = -8 ;
        INITIAL_FIRE_FLOWER_BOUNCE = -8 ;
        MAX_FALL_SPEED = 8 ; // lode runner has slow falling
        GRAV = 0.5 ; 
        ALLOW_RUNNING = false ;
        RUN_DELAY = 1 ; // in seconds
        ALLOW_SONIC_TRAIL_EFFECT = false ;
        TRAIL_SIZE = 6 ;
        ALLOW_MOVE_WHILE_JUMP = false ;
        ALLOW_SUPER_BOUNCE = false ;
        ALLOW_DOUBLE_JUMP = false ;
        DOUBLE_JUMP_ZONE = 8
        ALLOW_PARACHUTE = false ;
        ALLOW_JUMP_THROUGH = false ;
        ALLOW_WALL_JUMP = false ;
        WALL_JUMP_DELAY = 0.25 ; // in seconds
        WALL_JUMP_ZONE = 12 ; // this controls how close (speed wise) to the top of the jump before wall jumping allows
        ALLOW_EXTENDED_JUMP = false ;
        
        // artificial intelligence "constants"
        ENEMY_DECISION_FREQ = 3 ; // number of seconds between enemy AI decisions
        HOMING_DEAD_ZONE = 4 ;
        ALLOW_ENEMY_RESPAWN = true ;
        ENEMY_RESPAWN_DELAY = 10 * ROOM_SPEED ; // 10 seconds
        ENEMY_RESPAWN_SAFETY_DELAY = 1 * ROOM_SPEED; // 1 seconds
        ALLOW_ENEMY_OVERLAP = false ;
        
        // weapon and battle "constants"
        ALLOW_SHIELD = true ;
        ALLOW_PLAYER_WEAPON = true ;
        ALLOW_ENEMY_WEAPON = true ;
        ALLOW_PLAYER_MULTIPLE_BULLETS = true ;
        BULLET_PERSIST = 1 ;
        PLAYER_WEAPON_INTERVAL = 1 ; // in seconds
        ENEMY_WEAPON_DELAY = 4 ; // in seconds
        PLAYER_BOMB_DELAY = 3 ; // in seconds
        PLAYER_BOMB_RANGE = 3 ;
        PLAYER_BULLET_SPEED = 16 ;
        ENEMY_BULLET_SPEED = 16 ;
        ALLOW_PLAYER_WEAPON_BREAK_BREAKABLES = true ;
        ALLOW_PLAYER_WEAPON_KILL_TURRETS = true ;
        ALLOW_PLAYER_MELEE_KILL_ENEMY_WEAPONS = true ;
        ALLOW_BOMB_KILL_FRIENDLY = true ;
        ALLOW_ENEMY_WEAPON_BREAK_BREAKABLES = true ;
        ALLOW_DIGGING = true ;
        DIGGABLE_REFILL_DELAY = 4 ; // in seconds
        REFILL_ESCAPE_DELAY = 2 ; // in seconds
        ALLOW_FIRE_FLOWER_DESTROYED_ON_HIT = false ;
        
        // companion "constants"
        COMPANION_DECISION_FREQ = 0.5 ; // in seconds
        MAX_COMPANION_LAG = 400 ; // in pixels
        COMPANION_SENSE_RANGE = 200 ; // in pixels
        COMPANION_CLOSENESS_LIMIT = 32 ; // in pixels
        
        // bumpable obstacle "constants"
        BUMP_DELAY = 6 ; // in steps
        BUMP_AMOUNT = 4 ; // in pixels
        
        // falling obstacle "constants"
        FALLING_OBSTACLE_DELAY = 3 ; // in seconds
        
        break ;
        }
    case GAME_STYLE_GENERAL:
        {
        // General fun settings style
        global.coins_collected = 0 ;
        global.level = 1 ;
        global.score_before_level = score ; // used to reset score when level restarted
        global.coins_collected_before_level = global.coins_collected ; // used to reset coins count when level restarted
        global.entered_by_portal = false ;
        global.initial_room_time = 3 * 60 * ROOM_SPEED ;
        global.room_time = global.initial_room_time ;
        global.room_minutes = 0 ;
        global.room_seconds = 0 ;
        global.room_time_expired = false ;
        global.room_time_warning = false ;
        global.room_time_warning_threshold = 30 * ROOM_SPEED ; // warning at 30 seconds left

        // background and intro music control
        global.background_music = soundPacmanIntro ;
        global.background_music_loop = false ;
        
        // level reset behavior
        RESTART_LEVEL_ON_DEATH = true ;
        
        // allow room speed to be adjusted
        ROOM_SPEED = 30 ;
        
        // joystick settings (only in effect if joystick enabled
        JOYSTICK_SENSITIVITY = 0.4 ;
        JOYSTICK_UP_FOR_JUMP = false ; // can press up for jumping
                
        // allow auto sound panning
        AUTO_SOUND_PANNING = true ;
        
        // terrain parallax
        ALLOW_TERRAIN_PARALLAX = true ; // affects all objects with parent objParentTerrain

        // particles and effects
        ALLOW_PARTICLE_EFFECTS = true ;
        ALLOW_POINTS_FADE = true ;   
        POINTS_FADE_DELAY = 1.5 ; // in seconds
        
        // speed and movement related "constants"
        ALLOW_PLAYER_JUMPING = true ;
        ALLOW_ENEMY_JUMPING = true ;
        ENEMY_SPEED_FACTOR = 0.5 ;
        WALK_SPEED = 6 ;
        RUN_SPEED = 12 ;
        FLY_SPEED = 12 ;
        CLIMB_SPEED = 3 ;
        JUMP_SPEED = 8 ; // only used by treasure coins right now
        PLATFORM_SPEED = 3 ;
        CONVEYOR_SPEED = 2 ;
        CURRENT_SPEED = 4 ;
        MOVABLE_SPEED_FACTOR = 0.5 ;
        INITIAL_JUMP = -16 ;
        INITIAL_SUPER_JUMP = -22 ;
        INITIAL_DOUBLE_JUMP = -14 ;
        INITIAL_SQUASH_BOUNCE = -8 ;
        INITIAL_FIRE_FLOWER_BOUNCE = -8 ;
        MAX_FALL_SPEED = 14 ;
        GRAV = 0.9 ;
        ALLOW_RUNNING = true ;
        RUN_DELAY = 1 ; // in seconds
        ALLOW_SONIC_TRAIL_EFFECT = true ;
        TRAIL_SIZE = 6 ;
        ALLOW_MOVE_WHILE_JUMP = true ;
        ALLOW_SUPER_BOUNCE = false ;
        ALLOW_DOUBLE_JUMP = false ;
        DOUBLE_JUMP_ZONE = 8
        ALLOW_PARACHUTE = true ;
        ALLOW_JUMP_THROUGH = false ;
        ALLOW_WALL_JUMP = true ;
        WALL_JUMP_DELAY = 0.25 ; // in seconds
        WALL_JUMP_ZONE = 12 ; // this controls how close (speed wise) to the top of the jump before wall jumping allows
        ALLOW_EXTENDED_JUMP = true ;
                
        // artificial intelligence "constants"
        ENEMY_DECISION_FREQ = 3 ; // number of seconds between enemy AI decisions
        HOMING_DEAD_ZONE = 4 ;
        ALLOW_ENEMY_RESPAWN = false ;
        ENEMY_RESPAWN_DELAY = 1 * ROOM_SPEED ; // 1 seconds
        ENEMY_RESPAWN_SAFETY_DELAY = 0/5 * ROOM_SPEED; // 0.5 seconds
        ALLOW_ENEMY_OVERLAP = true ;

        // weapon and battle "constants"
        ALLOW_PLAYER_JUMPING = true ;
        ALLOW_ENEMY_JUMPING = true ;
        ALLOW_SHIELD = true ;
        ALLOW_PLAYER_WEAPON = true ;
        ALLOW_ENEMY_WEAPON = true ;
        ALLOW_PLAYER_MULTIPLE_BULLETS = true ;
        BULLET_PERSIST = 1 ;
        PLAYER_WEAPON_INTERVAL = 1 ; // in seconds
        ENEMY_WEAPON_DELAY = 4 ; // in seconds
        PLAYER_BOMB_DELAY = 3 ; // in seconds
        PLAYER_BOMB_RANGE = 3 ;
        PLAYER_BULLET_SPEED = 16 ;
        ENEMY_BULLET_SPEED = 16 ;
        ALLOW_PLAYER_WEAPON_BREAK_BREAKABLES = true ;
        ALLOW_PLAYER_WEAPON_KILL_TURRETS = true ;
        ALLOW_PLAYER_MELEE_KILL_ENEMY_WEAPONS = true ;
        ALLOW_BOMB_KILL_FRIENDLY = true ;
        ALLOW_ENEMY_WEAPON_BREAK_BREAKABLES = true ;
        ALLOW_DIGGING = true ;
        DIGGABLE_REFILL_DELAY = 4 ; // in seconds
        REFILL_ESCAPE_DELAY = 2 ; // in seconds
        ALLOW_FIRE_FLOWER_DESTROYED_ON_HIT = false ;
        
        // companion "constants"
        COMPANION_DECISION_FREQ = 0.5 ; // in seconds
        MAX_COMPANION_LAG = 400 ; // in pixels
        COMPANION_SENSE_RANGE = 200 ; // in pixels
        COMPANION_CLOSENESS_LIMIT = 32 ; // in pixels
        
        // bumpable obstacle "constants"
        BUMP_DELAY = 6 ; // in steps
        BUMP_AMOUNT = 4 ; // in pixels
        
        // falling obstacle "constants"
        FALLING_OBSTACLE_DELAY = 3 ; // in seconds
        
        break;
        }
    case GAME_STYLE_MENU:
        {
        // General fun settings style
        global.coins_collected = 0 ;
        global.level = 1 ;
        global.score_before_level = score ; // used to reset score when level restarted
        global.coins_collected_before_level = global.coins_collected ; // used to reset coins count when level restarted
        global.entered_by_portal = false ;
        global.initial_room_time = 3 * 60 * ROOM_SPEED ;
        global.room_time = global.initial_room_time ;
        global.room_minutes = 0 ;
        global.room_seconds = 0 ;
        global.room_time_expired = false ;
        global.room_time_warning = false ;
        global.room_time_warning_threshold = 30 * ROOM_SPEED ; // warning at 30 seconds left

        // background and intro music control
        global.background_music = soundBackgroundMenu ;
        global.background_music_loop = true ;
        
        // level reset behavior
        RESTART_LEVEL_ON_DEATH = true ;
        
        // allow room speed to be adjusted
        ROOM_SPEED = 30 ;
        
        // joystick settings (only in effect if joystick enabled
        JOYSTICK_SENSITIVITY = 0.4 ;
        JOYSTICK_UP_FOR_JUMP = false ; // can press up for jumping
                
        // allow auto sound panning
        AUTO_SOUND_PANNING = true ;
        
        // terrain parallax
        ALLOW_TERRAIN_PARALLAX = true ; // affects all objects with parent objParentTerrain
        
        // particle effects
        ALLOW_PARTICLE_EFFECTS = true ;
        ALLOW_POINTS_FADE = false ;
        POINTS_FADE_DELAY = 1.5 ; // in seconds
        
        // speed and movement related "constants"
        ALLOW_PLAYER_JUMPING = true ;
        ALLOW_ENEMY_JUMPING = true ;
        ENEMY_SPEED_FACTOR = 0.5 ;
        WALK_SPEED = 6 ;
        RUN_SPEED = 12 ;
        FLY_SPEED = 12 ;
        CLIMB_SPEED = 3 ;
        JUMP_SPEED = 8 ; // only used by treasure coins right now
        PLATFORM_SPEED = 3 ;
        CONVEYOR_SPEED = 2 ;
        CURRENT_SPEED = 4 ;
        MOVABLE_SPEED_FACTOR = 0.5 ;
        INITIAL_JUMP = -16 ;
        INITIAL_SUPER_JUMP = -22 ;
        INITIAL_DOUBLE_JUMP = -14 ;
        INITIAL_SQUASH_BOUNCE = -8 ;
        INITIAL_FIRE_FLOWER_BOUNCE = -8 ;
        MAX_FALL_SPEED = 14 ;
        GRAV = 0.9 ;
        ALLOW_RUNNING = true ;
        RUN_DELAY = 1 ; // in seconds
        ALLOW_SONIC_TRAIL_EFFECT = true ;
        TRAIL_SIZE = 6 ;
        ALLOW_MOVE_WHILE_JUMP = true ;
        ALLOW_SUPER_BOUNCE = false ;
        ALLOW_DOUBLE_JUMP = false ;
        DOUBLE_JUMP_ZONE = 8
        ALLOW_PARACHUTE = true ;
        ALLOW_JUMP_THROUGH = false ;
        ALLOW_WALL_JUMP = false ;
        WALL_JUMP_DELAY = 0.25 ; // in seconds
        WALL_JUMP_ZONE = 12 ; // this controls how close (speed wise) to the top of the jump before wall jumping allows
        ALLOW_EXTENDED_JUMP = true ;
                
        // artificial intelligence "constants"
        ENEMY_DECISION_FREQ = 3 ; // number of seconds between enemy AI decisions
        HOMING_DEAD_ZONE = 4 ;
        ALLOW_ENEMY_RESPAWN = false ;
        ENEMY_RESPAWN_DELAY = 1 * ROOM_SPEED ; // 1 seconds
        ENEMY_RESPAWN_SAFETY_DELAY = 0/5 * ROOM_SPEED; // 0.5 seconds
        ALLOW_ENEMY_OVERLAP = true ;

        // weapon and battle "constants"
        ALLOW_PLAYER_JUMPING = true ;
        ALLOW_ENEMY_JUMPING = true ;
        ALLOW_SHIELD = true ;
        ALLOW_PLAYER_WEAPON = true ;
        ALLOW_ENEMY_WEAPON = true ;
        ALLOW_PLAYER_MULTIPLE_BULLETS = true ;
        BULLET_PERSIST = 1 ;
        PLAYER_WEAPON_INTERVAL = 1 ; // in seconds
        ENEMY_WEAPON_DELAY = 4 ; // in seconds
        PLAYER_BOMB_DELAY = 3 ; // in seconds
        PLAYER_BOMB_RANGE = 3 ;
        PLAYER_BULLET_SPEED = 16 ;
        ENEMY_BULLET_SPEED = 16 ;
        ALLOW_PLAYER_WEAPON_BREAK_BREAKABLES = true ;
        ALLOW_PLAYER_WEAPON_KILL_TURRETS = true ;
        ALLOW_PLAYER_MELEE_KILL_ENEMY_WEAPONS = true ;
        ALLOW_BOMB_KILL_FRIENDLY = true ;
        ALLOW_ENEMY_WEAPON_BREAK_BREAKABLES = true ;
        ALLOW_DIGGING = true ;
        DIGGABLE_REFILL_DELAY = 4 ; // in seconds
        REFILL_ESCAPE_DELAY = 2 ; // in seconds
        ALLOW_FIRE_FLOWER_DESTROYED_ON_HIT = false ;
                
        // companion "constants"
        COMPANION_DECISION_FREQ = 0.5 ; // in seconds
        MAX_COMPANION_LAG = 400 ; // in pixels
        COMPANION_SENSE_RANGE = 200 ; // in pixels
        COMPANION_CLOSENESS_LIMIT = 32 ; // in pixels
        
        // bumpable obstacle "constants"
        BUMP_DELAY = 6 ; // in steps
        BUMP_AMOUNT = 4 ; // in pixels
        
        // falling obstacle "constants"
        FALLING_OBSTACLE_DELAY = 3 ; // in seconds
        
        break;
        }
    }

