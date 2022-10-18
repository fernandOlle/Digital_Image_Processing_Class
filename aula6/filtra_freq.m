function img_filtrada = filtra_freq(imagem, mascara)
% aplica Fourier transform
  img = fft2(imagem); 
  img = fftshift(img);
% aplica a mascara
  result = img .* mascara;
% volta o Fourier transform
  result = ifftshift(result);
  result = ifft2(result);
  figure, imshow(result, []);
endfunction
