//scr_move_axis
var dir=point_direction(0,0,xAxis,yAxis);
var hspd=lengthdir_x(spd,dir);
var vspd=lengthdir_y(spd,dir);
if(hspd!=0){
	image_xscale=sign(hspd);//this line allows the slime to face the player (left or right)
}
scr_get_face(dir);
movement=MOVE;
phy_position_x += hspd;
phy_position_y += vspd;
