function figura_out = restaura_mediana (figura_in, N)
% pega um dos canais;
% passa para double
% pega tamanha da imagem
% calcula a borda e aplica na imagem
% aplica o filtro duas vezes ponto a ponto
% salva e retorna a imagem

  fig = figura_in(:,:,1);
  fig = double(fig);
  [width height] = size(fig);
  padding = (N - 1) / 2;
  padded_img = padarray(fig, [padding padding], 0, 'both');

  for i = 1:width
    for j = 1:height
      output(i,j) = median(median(padded_img(i:i+padding*2, j:j+padding*2)));
    endfor
  endfor

  output = uint8(output);
  figure, imshow(output, []);
  figura_out = "restored_img_mediana.jpg";
  imwrite(output, figura_out);
endfunction
