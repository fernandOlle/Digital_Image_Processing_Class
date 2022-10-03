image = imread('barbara_gray.bmp', [;;1]);
img = corr_gama(image, 1, 10);
figure, imshow(img, []);
img = 'mountain.png';
img = imread(img);
image = janela(img);
figure, imshow(img, []);