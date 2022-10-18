img = imread('barbara_gray.bmp');
[height weight] = size(img);
x_center = height/2;
y_center = weight/2;

reject_frec_mask = ones(height, weight);
% Rejeita Faixa
for(i = 1 : height)
  for(j = 1 : weight)
    dist = distancia(i,j, x_center, y_center);
    if(dist > (weight*0.5)/4 && dist <= (weight*0.5)/2)
      reject_frec_mask(i,j) = 0;
    endif
  endfor
endfor
filtra_freq(img, reject_frec_mask);

allow_freq_mask = zeros(height, weight);
% Passa Faixa
for(i = 1 : height)
  for(j = 1 : weight)
    dist = distancia(i,j, x_center, y_center);
    if(dist > (weight*0.5)/4 && dist <= (weight*0.5)/2)
      allow_freq_mask(i,j) = 1;
    endif
  endfor
endfor
img = imread('barbara_gray.bmp');
filtra_freq(img, allow_freq_mask);

low_pass_mask = zeros(height, weight);
% Passa baixa
for(i = 1 : height)
  for(j = 1 : weight)
    if(distancia(i,j, x_center, y_center) <= (weight*0.5)/2)
      low_pass_mask(i,j) = 1;
    endif
  endfor
endfor
img = imread('barbara_gray.bmp');
filtra_freq(img, low_pass_mask);

high_pass_mask = ones(height, weight);
% Passa Alta
for(i = 1 : height)
  for(j = 1 : weight)
    if(distancia(i,j, x_center, y_center) <= 15)
      high_pass_mask(i,j) = 0;
    endif
  endfor
endfor
img = imread('barbara_gray.bmp');
filtra_freq(img, high_pass_mask);

vertical_border_mask = ones(height, weight);
% Elimina Bordas Verticais
for(i = x_center-25 : x_center+25)
  for(j = 1 : weight)
    if(distancia(i,j, x_center, y_center) > 25)
      vertical_border_mask(i,j) = 0;
    endif
  endfor
endfor
img = imread('barbara_gray.bmp');
filtra_freq(img, vertical_border_mask);