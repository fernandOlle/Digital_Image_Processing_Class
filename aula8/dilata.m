function img_dilatada = dilata(imagem, ES)
  % recebe tamanho da imagem e do padding
  [width height] = size(imagem);
  [padding_width padding_height] = size(ES);
  padding_width = floor(padding_width / 2);
  padding_height = floor(padding_height / 2);
  
  % adiciona o padding a image
  image_padding = padarray(imagem, [padding_width padding_height]);
  result_image = zeros(width, height);
  weight = sum(sum(ES));
  
  % aplica o processamento morfologico de dilataçao
  for i = 1:width
    for h = 1:height
      if (sum(sum(image_padding(i:i + padding_width * 2, h:h + padding_height * 2) .* ES)) == weight)
        img_saida(i, h) = 1;
      else 
        img_saida(i, h) = 0;
      endif
    endfor
  endfor
  imwrite(img_saida, 'dilated_image.jpg');
  img_dilatada = 'dilated_image.jpg';
endfunction
