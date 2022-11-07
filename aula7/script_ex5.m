pkg load image

imagem = imread("lena_cores.png");
imagemHSL = rgb2hsv(imagem);
hsl_transformer(imagemHSL, 1); % transforma canal h
hsl_transformer(imagemHSL, 2); % transforma canal S
hsl_transformer(imagemHSL, 3); % transforma canal L
