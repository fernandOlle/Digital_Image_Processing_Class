pkg load image

img = imread("lena_sal_e_pimenta.jpg"); 
img_out = restaura_media(img, 7); % restaura a imagem
figure, imshow(img_out);