function img_fechada = fechamento (imagem, ES)
  % dilata a iamgem
  dilated_image = dilata(imagem, ES);
  dilated_image = imread(dilated_image);
  dilated_image = im2bw(dilated_image, 0.5);
  % erode a imagem
  output_image = erosao(dilated_image, ES);
  output_image = imread(output_image);
  % salva e retorna imagem
  imwrite(output_image, 'closed_image.jpg');
  img_fechada = 'closed_image.jpg';
endfunction
