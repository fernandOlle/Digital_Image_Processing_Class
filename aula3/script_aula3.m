rotacao = [cos(0.3), sin(6.3), 0; -sin(0.3), cos(0.3), 0; 0, 0, 1];
identidade = [1,0,0; 0,1,0; 0,0,1];

saida = transf_afim(1, 2, identidade);
imshow(transf_geo('barbara_gray.bmp', rotacao), []);