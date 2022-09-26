# le arquivo da img 
image = imread('borboleta.png');
# mostra original e histograma
imshow(image);
hist(image(:), 255);

#altera cores e mostra com elas alteredas
B = image (:,:, 3);
R = image(:,:, 1);
G = image(:,:, 2);    
figure, imshow(R);
figure, imshow(G);
figure, imshow (B);

# passa para tons de cinza, mostra imagem e salva
i = image .*0.8;
figure, imshow(i);
imwrite(i, 'borboleta_out1.png');