image = imread('barbara_gray.bmp', [;;1]);
img = corr_gama(image, 1, 10);
figure, imshow(img, []);
image = janela('barbara_gray.bmp');
figure, imshow(img, []);
