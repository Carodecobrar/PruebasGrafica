function planoToCoordX(plano){
    return (mitadHorizontal + (plano * espacioEntreLineasHorizontal))*sign(plano);
}