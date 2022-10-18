image = imread('barbara_gray.bmp');
image = image(:,:,1);
% aplica o retorno do espectr/Fourier transform
trans = ifft2(image);
figure, imshow(log(abs(trans)), []);