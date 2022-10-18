image = imread('barbara_gray.bmp');
image = image(:,:,1);
% aplica Fourier e mostra
trans = fft2(image);
trans = fftshift(trans);
figure, imshow(log(abs(trans)), []);