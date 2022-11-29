function img_predita = predi(imagem)
  % monta o histograma pega o tamanho da imagem e instancia a matriz
  hist(imagem(:), 255);
  [width height] = size(imagem);
  img_predita(1:width, 1:height) = 0;

  % alimenta o padding para a predição
  for(i = 1 : height)
   img_predita(1,i) = 128;
   error(1,i) = imagem(1,i) - 128;
  endfor
  img_predita(2,1) = 128; 
  error(2,1) = imagem(2,1) - 128;
  
  % soma o valor da vizinhaça e o valor do erro
  for(i = 2 : width)
    for(j = 2 : height-1)
      img_predita(i,j) = round((img_predita(i-1,j-1) +  img_predita(i-1,j) +  img_predita(i-1,j+1) +  img_predita(i,j-1)) / 4);
      error(i,j) = imagem(i,j) - img_predita(i,j);
    endfor
  endfor

  % soma o valor da ultima coluna e o valor do erro
  for(i = 1 : width)
   img_predita(i,height) = 128;
   error(i,height) = imagem(i,height) - img_predita(i,height);
  endfor

  % mostra o historgrama do erro eo erro e a imagem final
  hist(error(:), 255);
  error(:,:) = error(:,:) + 128;
  figure, imshow(error);
  img_predita = uint8(img_predita);
  figure, imshow(img_predita);
endfunction