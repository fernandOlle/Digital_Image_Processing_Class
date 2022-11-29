pkg load image;

% le imagem e binariza
image = imread('scan.jpg');
image = im2bw(image, 0.5);

% monta o elemento estruturante
element_estruturante = [0  1  0;
                        1  2  1;
                        0  1  0];

% executa os processamentos morfologicos
figure, imshow(dilata(image, element_estruturante));
figure, imshow(erosao(image, element_estruturante));
figure, imshow(abertura(image, element_estruturante));
figure, imshow(fechamento(image, element_estruturante));
image_for_prediction = imread("lena_cinza.bmp");
predicted_image = predi(image_for_prediction);

