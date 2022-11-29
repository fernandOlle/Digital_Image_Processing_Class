function img_aberta = abertura (imagem, ES)
  % erode a image
  eroded_image = erosao(imagem, ES);
  eroded_image = imread(eroded_image);
  eroded_image = im2bw(eroded_image, 0.5);
  % dilata a image
  output_image = dilata(eroded_image, ES);
  output_image = imread(output_image);
  % retorna a image
  imwrite(output_image, 'open_image.jpg');
  img_aberta = 'open_image.jpg';
endfunction
