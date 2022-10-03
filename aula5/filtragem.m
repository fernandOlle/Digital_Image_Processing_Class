function saida = filtragem (img, filtro)
  % prepara img
  pkg load image 
  img = imread(img);
  img = double(img);
  
  % prepara variaveis
  peso = sum(sum(filtro));
  [col row] = size(filtro);
  [img_col img_row] = size(img);
  tmp = zeros();
  res = zeros();
  
  % adiciona margem na imagem
  img = padarray(img, [floor(col/2) floor(row/2)], 0, 'both');
  
  for i = 1:img_row
    for j = 1:img_col
      % aplica o filtro 
      temp = (img(i:i+row-1, j:j+col-1) .*filtro);
      % acumula resultado
      res(i, j) = round(sum(sum(temp)) / peso);
    endfor
  endfor
  % retorna imagem para int e imprimi 
  img = uint8(res);
  figure, imshow(img);
  saida = img;
endfunction
