//scr_chance(percentage)
var percent = argument0; //makes percent an argument
percent=clamp(percent,0,1);//makes percent a value between 0 and 1
return (random(1)<percent); //returns true or false