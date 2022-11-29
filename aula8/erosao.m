function img_erodida = erosao(imagem, ES)
  % recebe tamanho da imagem e do padding
  [width height] = size(imagem);
  [padding_width padding_height] = size(ES);
  padding_width = floor(padding_width / 2);
  padding_height = floor(padding_height / 2);
  
  % adiciona o padding a image
  image_padding = padarray(imagem, [padding_width padding_height]);
  result_image = zeros(width, height);
  
  % aplica o processamento morfologico de erosao
  for i = 1:width
    for h = 1:height
      if (sum(sum(image_padding(i:i + padding_width * 2, h:h + padding_height * 2) * ES)) == 0)
        result_image(i, h) = 0;
      else 
        result_image(i, h) = 1;
      endif
    endfor
  endfor
  imwrite(result_image, 'eroded_iamge.jpg');
  img_erodida = 'eroded_iamge.jpg';
endfunction
