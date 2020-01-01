//scr_attack_state
movement=ATTACK;
if(scr_animation_hit_frame(3)){
	var xx=0;
	var yy=0;
	//these cringy stuffs move the damage object from the player!
	switch(face){
		case DOWN: //you need colons after "case" :/
		sprite_index=spr_player_shootDOWN;
		xx=x;//change these in accordance to the animation
		yy=y;
		break;
	
		case UP:
		sprite_index=spr_player_shootUP;
		xx=x;//change these in accordance to the animation
		yy=y;
		break;
	
		case LEFT:
		sprite_index=spr_player_shootLEFT;
		xx=x;//change these in accordance to the animation
		yy=y;
		break;
	
		case RIGHT:
		sprite_index=spr_player_shootRIGHT;
		xx=x;//change these in accordance to the animation
		yy=y;
		break;
	}
}