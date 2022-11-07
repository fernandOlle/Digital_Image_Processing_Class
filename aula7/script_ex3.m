pkg load image

img = imread("lena_sal_e_pimenta.jpg");
img_out = restaura_mediana(img, 5); % restaura imagem

figure, imshow(img_out);
