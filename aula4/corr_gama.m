function img = corr_gama(img, c, gama)
  img = double(img);
  img = c .* img .^ gama;
  min_val = min(min(img));
  max_val = max(max(img));
  img = round(img .* 255 / (max_val - min_val));
endfunction
