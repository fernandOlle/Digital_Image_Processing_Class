pkg load image

img = imread('barbara_gray.bmp');

% 3 niveis de filtro gaussian
m = 0;
var_gauss = 0.01;
img_1 = imnoise(img, 'gaussian', m, var_gauss);
figure, imshow(img_1);

m = 0.3;
var_gauss = 0.01;
img_2 = imnoise(img, 'gaussian', m, var_gauss);
figure, imshow(img_2);

m = 0.5;
var_gauss = 0.05;
img_3 = imnoise(img, 'gaussian', m, var_gauss);
figure, imshow(img_3);

% filtro poisson
img_4 = imnoise(img, 'poisson');
figure, imshow(img_4);

% 2 niveis de filtro salt & papper
d = 0.02;
img_5 = imnoise(img, 'salt & pepper', d);
figure, imshow(img_5);

d = 0.1;
img_6 = imnoise(img, 'salt & pepper', d);
figure, imshow(img_6);
