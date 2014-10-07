// default mapping of input
switch global.input_style
    {
    case KEYBOARD:
        {
        INPUT_LEFT = vk_left ;
        INPUT_RIGHT = vk_right ;
        INPUT_UP = vk_up ;
        INPUT_DOWN = vk_down ;
        INPUT_JUMP = vk_space ;
        INPUT_SHOOT = vk_control ;
        INPUT_SWITCH_WEAPON = vk_w ;
        INPUT_SHIELD = vk_alt ;
        INPUT_DIG_LEFT = vk_z ;
        INPUT_DIG_RIGHT = vk_x ;
        break ;
        }
    case JOYSTICK:
        {
        // don't need INPUT_LEFT because always mapped to joystick direction left
        // don't need INPUT_RIGHT because always mapped to joystick direction right
        // don't need INPUT_UP because always mapped to joystick direction up
        // don't need INPUT_DOWN because always mapped to joystick direction down
        INPUT_JUMP = 2 ;
        INPUT_SHOOT = 3 ;
        INPUT_SWITCH_WEAPON = 1 ;
        INPUT_SHIELD = 4 ;
        INPUT_DIG_LEFT = 7 ;
        INPUT_DIG_RIGHT = 8 ;
        break ;
        }
    case DPAD:
        {
        // don't need INPUT_LEFT because always mapped to d-pad direction left
        // don't need INPUT_RIGHT because always mapped to d-pad direction right
        // don't need INPUT_UP because always mapped to d-pad direction up
        // don't need INPUT_DOWN because always mapped to d-pad direction down
        INPUT_JUMP = 2 ;
        INPUT_SHOOT = 3 ;
        INPUT_SWITCH_WEAPON = 1 ;
        INPUT_SHIELD = 4 ;
        INPUT_DIG_LEFT = 7 ;
        INPUT_DIG_RIGHT = 8 ;
        break ;
        }
    }
