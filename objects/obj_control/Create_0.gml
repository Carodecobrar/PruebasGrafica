actualFrame = 0;
frameGap = 5;
frameSpeed = 1;
mitadHorizontal = room_width / 2;
mitadVertical = room_height / 2;
contadorX = 1;
altoDeLinea = 5;
anchoDeLinea = 5;
microMapString = "0123456789-";
microFont = font_add_sprite_ext(sprMicroFont, microMapString, false, 0);
//coordenadas abstractas
escala = 20;
minX = -mitadHorizontal / escala;
maxX = mitadHorizontal / escala;