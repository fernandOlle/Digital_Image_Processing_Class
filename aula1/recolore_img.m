# le arquivo da img 
a = imread('borboleta.png');

# pega pixel laranja
[x, y] = find(a(:,:,1)==246 & a(:,:,2)==127 & a(:,:,3)==0);
[tamanho, dimensao] = size(x);
#muda cor do pixel laranja
for(i = 1 : tamanho)
  a(x(i), y(i), : ) = [34;139;34];
endfor

# pega pixels bege
[x, y] = find(a(:,:,1)==255 & a(:,:,2)==246 & a(:,:,3)==227);
[tamanho, dimensao] = size(x);
# muda cor do pixel bege
for(i = 1 : tamanho)
  a(x(i), y(i), : ) = [255;20;147];
endfor

# mostra resultado e salva no arquivo 
imshow(a);
imwrite(a, 'borboleta_out2.png');
