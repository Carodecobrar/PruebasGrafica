
/*
x = 0 -> y=0
x = 1 -> y=1
*/
LeerEcuacion(ecuacion);
////Lineal
//if (ecuacion == "y=x") {
    //contadorY = contadorX;
//}
////Cuadratica
//if (ecuacion == "y=x^2") {
    //contadorY = power(contadorX, 2);
//}
////Radical
//if (ecuacion == "y=sqrt{x}") {
    //contadorY = sqrt(contadorX);
//}
if (ecuacion == "") {
    contadorX += (velocidadX)*direccionX;
    contadorY += (velocidadY)*direccionY;
} else {
    contadorX += velocidadX;
    contadorSeparacionTraza++;
    if (contadorSeparacionTraza > framesSeparacionTraza) {
        if (instance_number(obj_traza)< 35 && (puntoPrevioX != (puntoOrigenX+contadorX)) && (puntoPrevioY != (puntoOrigenY+contadorY)))
            instance_create_layer(puntoOrigenX+contadorX, puntoOrigenY-contadorY, "instances", obj_traza);
        puntoPrevioX = puntoOrigenX+contadorX;
        puntoPrevioY = puntoOrigenY+contadorY;
        contadorSeparacionTraza = 0;
    }
}