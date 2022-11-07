function figura_out  = restaura_media (figura_in, N)
% pega um dos canais;
% passa para double
% pega tamanha da imagem
% cria o filtro
% calcula a borda e aplica na imagem
% cria calcula o peso do filtro
% aplica o filtro, salva e retorna a imagem

  fig = figura_in(:,:,1);
  fig = double(fig);
  [width height] = size(fig);
  filter(1:N, 1:N) = 1;
  padding = (N - 1) / 2;
  padded_img = padarray(fig, [padding padding], 0, 'both');
  weight = sum(sum(filter));

  for i = 1:width
    for j = 1:height
      output(i,j) = round(sum(sum(padded_img(i:i+padding*2, j:j+padding*2) .* filter)) / weight);
    endfor
  endfor

  output = uint8(output);
  figure, imshow(output, []);
  figura_out = "restored_img_media.jpg";
  imwrite(output, figura_out);
endfunction
