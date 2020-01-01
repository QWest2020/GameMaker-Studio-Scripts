//scr_enemy_choose_next_state
if(alarm[0] <= 0){
	state=choose(scr_enemy_wander_state, scr_enemy_idle_state);
	alarm[0] = room_speed*irandom_range(2,4);//integer between the two numbers (inclusive)
	if(state==scr_enemy_wander_state){//only switches its direction when it "decides" to wander
		xAxis=random_range(-1,1);
		yAxis=random_range(-1,1);
	}
}
