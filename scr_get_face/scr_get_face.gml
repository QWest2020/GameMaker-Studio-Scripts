//scr_get_face(dir)
//splits 360 degrees into 4 directions
//if you had diagonal animations, you would divide by 45
var dir=argument0;
face=round(dir/90);
if(face==4 or face==0){
face=RIGHT;
}
if(face==3){
face=DOWN;
}
if(face==2){
face=LEFT;
}
if(face==1){
face=UP;
}
