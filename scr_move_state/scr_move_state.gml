///scr_move_state

//interction (made by HeartBeast)
if(obj_input.interactKey){//space key
	var xDir=lengthdir_x(8,face*90);
	var yDir=lengthdir_y(8,face*90);
	var speaker=instance_place(x+xDir,y+yDir,obj_speaker);
    if(speaker!=noone){//talk to it
		with(speaker){
			if(!instance_exists(dialogue)){
				dialogue=instance_create_depth(x-5,y-20,-1000,obj_dialogue);
				dialogue.text=text;//makes the text in the dialogue box the same as the dialogue text
			}
			else{
				dialogue.text_page++;//next page
				dialogue.text_count=0;//begins again
				if(dialogue.text_page>array_length_1d(dialogue.text)-1){
					with(dialogue){
						instance_destroy();
					}
				}
			}
		}
	}
}

//attacking
if(obj_input.attackKey){
	image_index=0;
	state=scr_attack_state;
}

//sprinting
Newspd=0;
Newimagespd=0;
if(obj_input.dashKey
	&&!obj_input.attackKey
	&&obj_player_stats.stamina>=DASH_COST){
		Newspd=SPRINTSPD;//sprinting speed
		Newimagespd=SPRINTIMAGESPD;//sprinting animation
		//dashing formula
		alarm[0]=room_speed*15;//total regen time!
		obj_player_stats.stamina-=(DASH_COST/5);//sprint time constant!
		obj_player_stats.alarm[1]=room_speed*5;//total delay time!
		if(obj_player_stats.stamina<DASH_COST){//set display to zero
			obj_player_stats.stamina=0;
		}

}
else if(obj_input.attackKey){
	Newspd=1;
	Newimagespd=.5;//this is also the shooting speed
}
else{//no change
	Newspd=1;
	Newimagespd=1;
}

//control the sprite animations
image_speed=Newimagespd;


//get direction
dir=point_direction(0,0,obj_input.x_axis,obj_input.y_axis);

//get da length
if(obj_input.x_axis==0 and obj_input.y_axis==0){
	len=0;
}
else{
	len=spd;
	scr_get_face(dir);
}

//get h and v speed
h_spd=lengthdir_x(len,dir);
v_spd=lengthdir_y(len,dir);

//move
phy_position_x+=h_spd*Newspd;
phy_position_y+=v_spd*Newspd;

//none
if(len==0){
	image_index=0;
}



//shooting
if(obj_input.attackKey &&
	obj_player_stats.alarm[0]<=0 && 
	obj_player_stats.ammo>0){
	var projectile=instance_create_depth(x,y,0,obj_bullet);
	var xForce=lengthdir_x(20,face*90);
	var yForce=lengthdir_y(20,face*90);
	projectile.creator=id;
	with(projectile){
		physics_apply_impulse(x,y,xForce,yForce);
	}
	obj_player_stats.alarm[0]=room_speed/obj_player_stats.shoot_spd;
	obj_player_stats.ammo--;//minus one bullet
}