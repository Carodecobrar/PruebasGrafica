function ReducirMiembros(miembro, variable){
    var length = string_length(miembro);
    if (length > 1) {
        //Potenciacion
        if (string_pos("^", miembro) > 0) {
            var subMiembros = SplitByOperadores(miembro);
            var resultado = power(variable, real(subMiembros[1]));
            return resultado;
        }
        //Raiz
        if (string_pos("√", miembro) > 0) {
            var subMiembros = SplitByOperadores(miembro);
            var resultado = sqrt(variable);
            return resultado;
        }
    }
    return variable;
}