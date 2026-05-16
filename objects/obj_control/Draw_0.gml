//plano cartesiano
draw_set_color(c_white);
draw_line(0, mitadVertical, room_width, mitadVertical);
draw_line(mitadHorizontal, 0, mitadHorizontal, room_height);

//X+1
//X-1
//Y+1
//Y-1
draw_set_color(c_green);
draw_circle(puntoOrigenX+contadorX, puntoOrigenY-contadorY, 1, false);