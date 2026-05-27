//plano cartesiano
draw_set_font(microFont);
draw_set_color(c_white);
//Ejes
draw_line(0, mitadVertical, room_width, mitadVertical);
draw_line(mitadHorizontal, 0, mitadHorizontal, room_height);
//Lineas
for (var i = 1; i <= escala; i++) {
    //X
    //Positivo
	draw_line(mitadHorizontal + (espacioEntreLineasHorizontal*i), mitadVertical - altoDeLinea, mitadHorizontal + (espacioEntreLineasHorizontal*i), mitadVertical + altoDeLinea);
    draw_text(mitadHorizontal + (espacioEntreLineasHorizontal*i), mitadVertical - altoDeLinea, i);
    //Negativo
	draw_line(mitadHorizontal - (espacioEntreLineasHorizontal*i), mitadVertical - altoDeLinea, mitadHorizontal - (espacioEntreLineasHorizontal*i), mitadVertical + altoDeLinea);
    draw_text(mitadHorizontal - (espacioEntreLineasHorizontal*i), mitadVertical - altoDeLinea, i);
    //Y
    //Positivo
    draw_line(mitadHorizontal - anchoDeLinea, mitadVertical - (espacioEntreLineasVertical*i), mitadHorizontal + anchoDeLinea, mitadVertical - (espacioEntreLineasVertical*i));
    draw_text(mitadHorizontal - anchoDeLinea, mitadVertical - (espacioEntreLineasVertical*i), i);
    //Negativo
    draw_line(mitadHorizontal - anchoDeLinea, mitadVertical + (espacioEntreLineasVertical*i), mitadHorizontal + anchoDeLinea, mitadVertical + (espacioEntreLineasVertical*i));
    draw_text(mitadHorizontal - anchoDeLinea, mitadVertical + (espacioEntreLineasVertical*i), i);
}
//y = x^2
var equation = "x^2";
var X = mitadHorizontal;
var Y = mitadVertical;
if (actualFrame == 0) {
    var coordX = X + (espacioEntreLineasHorizontal*contadorX);
    var resultY = parseEquation(equation, coordToPlanoX(coordX), 0);
    var newX = coordX;
    var newY = (Y - (espacioEntreLineasVertical*resultY));
    var outOfBounds = newX < 0 || newX > room_width || newY < 0 || newY > room_height;
    if (!outOfBounds) {
        var punto = {
            X: newX,
            Y: newY
        };
        array_push(puntos, punto);
        contadorX+=xSpeed*xDir;
    } else {
        show_debug_message("Fuera del room!");
    }
}
draw_set_color(c_green);
for (var i = 0; i < array_length(puntos); i++) {
	var puntoActual = puntos[i];
    draw_circle(puntoActual.X, puntoActual.Y, 2.5, false);
}