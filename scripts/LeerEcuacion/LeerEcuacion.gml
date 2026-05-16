function LeerEcuacion(expresion){
    var miembros = string_split(expresion, "=", true, 100);
    variables = {
        a: contadorX,
        b: contadorY
    }
    //Homologar las incognitas a sus respectivas variables
    //a=b
    var nombreVariableMiembroIzq = "a";
    var nombreVariableMiembroDer = "b";
    if (string_pos("y", miembros[0]) > 0) {
        nombreVariableMiembroIzq = "b";
    }
    if (string_pos("x", miembros[0]) > 0){
        nombreVariableMiembroIzq = "a";
    }
    if (string_pos("y", miembros[1]) > 0){
        nombreVariableMiembroDer = "b";
    }
    if (string_pos("x", miembros[1]) > 0){
        nombreVariableMiembroDer = "a";
    }
    //Reducir miembros a su minima expresion
    variables[$ nombreVariableMiembroIzq] = ReducirMiembros(miembros[0], variables[$ nombreVariableMiembroIzq]);
    variables[$ nombreVariableMiembroDer] = ReducirMiembros(miembros[1], variables[$ nombreVariableMiembroDer]);
    //Aplicar expresion
    variables[$ nombreVariableMiembroIzq] = variables[$ nombreVariableMiembroDer];
    if (string_pos("y", miembros[0]) > 0){
        contadorY = variables[$ nombreVariableMiembroIzq];
    }
    if (string_pos("x", miembros[0]) > 0){
        contadorX = variables[$ nombreVariableMiembroIzq];
    }
    if (string_pos("y", miembros[1]) > 0){
        contadorY = variables[$ nombreVariableMiembroDer];
    }
    if (string_pos("x", miembros[1]) > 0){
        contadorX = variables[$ nombreVariableMiembroDer];
    }
}