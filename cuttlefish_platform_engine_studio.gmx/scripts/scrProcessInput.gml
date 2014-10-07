// it is much preferable to fully process the user input once per step
// rather than checking it all over the place.  This aids in resolving
// input conflicts (like pressing right and left together) as well as 
// aiding in remapping or switching between keyboard and joystick methods.


// note that the input constants like INPUT_JUMP are expected to be either keycode constants or button numbers
// depending on the input type
switch global.input_style
    {
    case KEYBOARD:
        {
        kLeft = keyboard_check(INPUT_LEFT) ;
        kLeftPressed = keyboard_check_pressed(INPUT_LEFT) ;
        kRight = keyboard_check(INPUT_RIGHT)  ;
        kRightPressed = keyboard_check_pressed(INPUT_RIGHT) ;
        kUp = keyboard_check(INPUT_UP) ;
        kUpPressed = keyboard_check_pressed(INPUT_UP) ;
        kDown = keyboard_check(INPUT_DOWN) ;
        kDownPressed = keyboard_check_pressed(INPUT_DOWN) ;
        kJump = keyboard_check(INPUT_JUMP) ;
        kJumpPressed = keyboard_check_pressed(INPUT_JUMP) ;
        kWeaponPressed = keyboard_check_pressed(INPUT_SHOOT) ;
        kSwitchWeaponPressed = keyboard_check_pressed(INPUT_SWITCH_WEAPON) ;
        kShield = keyboard_check(INPUT_SHIELD) ;
        kDigLeftPressed = keyboard_check_pressed(INPUT_DIG_LEFT) ;
        kDigRightPressed = keyboard_check_pressed(INPUT_DIG_RIGHT) ;
        kNone = keyboard_check(vk_nokey) ;
        break ;
        }
    case JOYSTICK:
        {
        // need to create equivalent of "pressed" events, by remembering previous step's value
        // diagonals will count as both component directions
        joystick_left = (joystick_xpos(0) <= -JOYSTICK_SENSITIVITY)  ;
        kLeftPressed = not kLeft and joystick_left ;        
        kLeft = joystick_left ; 
        joystick_right = (joystick_xpos(0) >= JOYSTICK_SENSITIVITY)  ;
        kRightPressed = not kRight and joystick_right ;        
        kRight = joystick_right ;
        joystick_up = (joystick_ypos(0) <= -JOYSTICK_SENSITIVITY)  ;
        kUpPressed = not kUp and joystick_up ;        
        kUp = joystick_up ;
        joystick_down = (joystick_ypos(0) >= JOYSTICK_SENSITIVITY)  ;
        kDownPressed = not kDown and joystick_down ;        
        kDown = joystick_down ;
        // shield doesn't have a pressed event
        kShield = joystick_check_button(0, INPUT_SHIELD) ;
        joystick_jump = joystick_check_button(0, INPUT_JUMP) ;
        kJumpPressed = not kJump and joystick_check_button(0, INPUT_JUMP) ;  
        kJump = joystick_jump ; // mostly kJumpPressed should be used for jumping, but for wall jumping kJump is useful   
        // override jump with joystick up if allowed
        if JOYSTICK_UP_FOR_JUMP then
            {
            kJumpPressed = kUpPressed ;
            kJump = kUp ;
            }        
        // some mappings are pressed only, so reverse the way the temp joystick variable is used (now remembers previous)     
        kWeaponPressed = not joystick_weapon and joystick_check_button(0, INPUT_SHOOT) ;        
        joystick_weapon = joystick_check_button(0, INPUT_SHOOT) ;
        kSwitchWeaponPressed = not joystick_switch_weapon and joystick_check_button(0, INPUT_SWITCH_WEAPON) ;        
        joystick_switch_weapon = joystick_check_button(0, INPUT_SWITCH_WEAPON) ;
        kDigLeftPressed = not joystick_dig_left and joystick_check_button(0, INPUT_DIG_LEFT) ;        
        joystick_dig_left = joystick_check_button(0, INPUT_DIG_LEFT) ;
        kDigRightPressed = not joystick_dig_right and joystick_check_button(0, INPUT_DIG_RIGHT) ;        
        joystick_dig_right = joystick_check_button(0, INPUT_DIG_RIGHT) ;
        // kNone here not quite equivalent to keyboard but prob better as to be no movement rather than no key at all
        kNone = not (kLeft or kRight or kUp or kDown or kJumpPressed) ; 
        break ;
        }
    case DPAD:
        {
        // need to create equivalent of "pressed" events, by remembering previous step's value
        // diagonals will count as both component directions
        joystick_left = (joystick_pov(0) == 270 or joystick_pov(0) == 315 or joystick_pov(0) == 225)  ;
        kLeftPressed = not kLeft and joystick_left ;        
        kLeft = joystick_left ; 
        joystick_right = (joystick_pov(0) == 90 or joystick_pov(0) == 45 or joystick_pov(0) == 135)  ;
        kRightPressed = not kRight and joystick_right ;        
        kRight = joystick_right ;
        joystick_up = (joystick_pov(0) == 0 or joystick_pov(0) == 315 or joystick_pov(0) = 45)  ;
        kUpPressed = not kUp and joystick_up ;        
        kUp = joystick_up ;
        joystick_down = (joystick_pov(0) == 180 or joystick_pov(0) == 135 or joystick_pov(0) = 225)  ;
        kDownPressed = not kDown and joystick_down ;        
        kDown = joystick_down ;
        // shield doesn't have a pressed event
        kShield = joystick_check_button(0, INPUT_SHIELD) ;
        joystick_jump = joystick_check_button(0, INPUT_JUMP) ;
        kJumpPressed = not kJump and joystick_check_button(0, INPUT_JUMP) ;  
        kJump = joystick_jump ; // mostly kJumpPressed should be used for jumping, but for wall jumping kJump is useful   
        // override jump with joystick up if allowed
        if JOYSTICK_UP_FOR_JUMP then
            {
            kJumpPressed = kUpPressed ;
            kJump = kUp ;
            }
        // some mappings are pressed only, so reverse the way the temp joystick variable is used (now remembers previous)     
        kWeaponPressed = not joystick_weapon and joystick_check_button(0, INPUT_SHOOT) ;        
        joystick_weapon = joystick_check_button(0, INPUT_SHOOT) ;
        kSwitchWeaponPressed = not joystick_switch_weapon and joystick_check_button(0, INPUT_SWITCH_WEAPON) ;        
        joystick_switch_weapon = joystick_check_button(0, INPUT_SWITCH_WEAPON) ;
        kDigLeftPressed = not joystick_dig_left and joystick_check_button(0, INPUT_DIG_LEFT) ;        
        joystick_dig_left = joystick_check_button(0, INPUT_DIG_LEFT) ;
        kDigRightPressed = not joystick_dig_right and joystick_check_button(0, INPUT_DIG_RIGHT) ;        
        joystick_dig_right = joystick_check_button(0, INPUT_DIG_RIGHT) ;
        // kNone here not quite equivalent to keyboard but prob better as to be no movement rather than no key at all
        kNone = not (kLeft or kRight or kUp or kDown or kJumpPressed) ; 
        break ;
        }
    }

// resolve conflicts, which mainly happen when using keyboard
if kLeft and kRight then // pressing left and right cancels both
    {
    kLeft = false ;
    kRight = false ;
    }
if kLeftPressed and kRightPressed then
    {
    kLeftPressed = false ;
    kRightPressed = false ;
    }
if kDown and kUp then // pressing up and down cancels both
    {
    kUp = false ;
    kDown = false ;
    }
if kDownPressed and kUpPressed then
    {
    kDownPressed = false ;
    kUpPressed = false ;
    }
