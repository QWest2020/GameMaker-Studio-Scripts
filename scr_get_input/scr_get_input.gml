//script: get input
rightKey=keyboard_check(vk_right);
leftKey=keyboard_check(vk_left);
upKey=keyboard_check(vk_up);
downKey=keyboard_check(vk_down);
dashKey=keyboard_check(vk_lshift);
attackKey=keyboard_check(vk_alt);
interactKey=keyboard_check(vk_space);

x_axis =(rightKey-leftKey);
y_axis =(downKey-upKey);
