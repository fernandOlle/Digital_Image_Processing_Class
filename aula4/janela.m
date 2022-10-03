function img = janela(imagem)
  #leitura e tamanho da imagem de entrada
  imagem = imread(imagem);
  imagem = double(imagem);
  [x y] = size(imagem);

  #definicao da mask
  mask = [1 2 1; 
          2 4 2; 
          1 2 1];
  [maskX maskY] = size(mask);
  #calcula a quantidade de padding que vai ser adicionado a direcao da imagem
  #no caso dessa mask sera 1
  paddingX = floor(maskX / 2);
  paddingY = floor(maskY / 2);

  #cria uma nova imagem com padding
  #multiplica padding por 2 pois precisa adicionar padding em todas as direcoes
  zeropadding_imagem = zeros(x + (paddingX * 2), y + (paddingY * 2));
  #'transfere' a imagem original para a imagem com padding levando em consideracao o descolamento do padding
  zeropadding_imagem(paddingX + 1:x + paddingX, paddingY + 1:y + paddingY) = imagem;
  #cria a imagem de saida com a mesma resolucao da de entrada
  img = zeros(x,y);

  #iteracao por linhas e colunas da imagem de saida
  for lin = 1:x
    for col = 1:y
      #multiplicacao ponto a ponto da matriz de mask com a imagem com paddings
      #padding multiplicado por dois para levar em consideracao o padding em todos os lados da imagem
      m = zeropadding_imagem(lin : lin + paddingX * 2, col : col + paddingY * 2) .* mask;
      #primeira sum retorna uma linha com a soma das colunas
      #segunda sum retorna a soma dos elementos dessa linha, retornando um unico valor
      #divide esse valor por 16 e arredonda para salvar na imagem de saida
      img(lin, col) = round(sum(sum(m, 1), 2) / 16);
    endfor
  endfor
endfunction