//plano cartesiano
draw_set_font(microFont);
draw_set_color(c_white);
//Ejes
draw_line(0, mitadVertical, room_width, mitadVertical);
draw_line(mitadHorizontal, 0, mitadHorizontal, room_height);
//Lineas
var espacioEntreLineasHorizontal = mitadHorizontal / escala;
var espacioEntreLineasVertical = mitadVertical / escala;
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
//y = x² + 3x - 2
var equation = "x^2";
var X = mitadHorizontal;
var Y = mitadVertical;
if (actualFrame == 0) {
    var resultY = parseEquation(equation, X, 0);
    var newX = X+(frameGap*contadorX);
    var tooFarUpLeft = newX < 0 || resultY < 0;
    var tooFarUpRight = newX > room_width || resultY < 0;
    var tooFarDownLeft = newX < 0 || resultY > room_height;
    var tooFarDownRight = newX > room_width || resultY > room_height;
    var outOfBounds = tooFarUpLeft || tooFarUpRight || tooFarDownLeft || tooFarDownRight;
    if (!outOfBounds) {
    } else {
        instance_create_layer(newX, resultY, "instances", obj_traza);
        show_debug_message("Fuera del room!")
    }
    contadorX += 1;
}