function planoToCoordX(plano){
    var result = plano - escala;
    return result > 0?result * escala:0;
}