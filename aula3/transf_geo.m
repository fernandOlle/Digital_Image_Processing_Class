function saida = transf_geo (img, T)
  img = imread(img);
  img = double(img);
  img_size = size(img);
  lin = img_size(1);
  col = img_size(2);
  saida = zeros(lin, col);
  % acima cria a matriz de zeros, faz as operacoes na imagem e pega seu tamanho
  % horzintal e vertical
  for i = 1:lin
    for j = 1:col
       % faz a tansformacao do ponto por T e pega o floor das coordenadas do ponto
       [x y] = transf_afim(i, j, T);
       x = floor(x);
       y = floor(y);
       % preenche a saida com o ponto da imagem correspondende ao ponto resultado
       % da transf_afim
       if (x >= 1 && x <= lin && y >= 1 && y <= col)
         saida(x, y) = img(i, j);
       endif 
    endfor
  endfor
endfunction

