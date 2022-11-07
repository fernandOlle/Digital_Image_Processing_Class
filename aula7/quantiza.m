function imagemSaida = quantiza (entrada, saida, bitsY, bitsCb, bitsCr)
% coloca imagem em YCbCr
% separa os canais
% quantiza os cada um dos canais e dps volta a imagem para YCbCr
% retorna e salva a imagem

  img = imread(entrada);
  imagemSaida = rgb2ycbcr(img);
  Y = imagemSaida(:,:,1);
  Cb = imagemSaida(:,:,2);
  Cr = imagemSaida(:,:,3);
  [width height] = size(Y);

  for i = 1 : width
    for j = 1 : height
      Y(i,j)  = floor((Y(i,j))  / (256 / (2 ^ bitsY)));
      Cb(i,j) = floor((Cb(i,j)) / (256 / (2 ^ bitsCb)));
      Cr(i,j) = floor((Cr(i,j)) / (256 / (2 ^ bitsCr)));
    endfor
  endfor

  imagemSaida(:,:,1) = Y(:,:)  .* (256 / (2 ^ bitsY));
  imagemSaida(:,:,2) = Cb(:,:) .* (256 / (2 ^ bitsCb));
  imagemSaida(:,:,3) = Cr(:,:) .* (256 / (2 ^ bitsCr));
  imagemSaida = ycbcr2rgb(imagemSaida);
  figure, imshow(imagemSaida);
  imwrite(imagemSaida, saida);
endfunction
