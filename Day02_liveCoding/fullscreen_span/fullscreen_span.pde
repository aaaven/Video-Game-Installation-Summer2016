/*Created by Aven on July 8th 
for Go beyond classics: Bring video game into real world
live Demo on Fullscreen,SPAN mode
laptop is connecting to sharp projector when the code is running
*/

void setup(){
 fullScreen(SPAN);
 //fullScreen(2);
 fill(255,0,0);
 rect(100,100,600,400);
 fill(0,255,0);
 rect(900,100,1080,600);
 println(width,height);//switch between fullcreen(1)and 2 print out resolutions
 //projection screen: 800*600
 //laptop screen: 1280*800
 //display arrangement Tips: projector on left and align to top
}