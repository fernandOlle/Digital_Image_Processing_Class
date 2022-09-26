function adj_sim_nao = adjacente(x1, y1, x2, y2, modelo, image)
  img = imread(image);
  bin_img = im2bw(img, 0.5);

  adj_sim_nao = false;
  if (modelo == 4)
    adj_sim_nao = adj_4(x1, y1, x2, y2, img);
  elseif(modelo == 8)
    adj_sim_nao = adj_8(x1, y1, x2, y2, img);
  elseif(modelo == 'm')
    adj_sim_nao = adj_m(x1, y1, x2, y2, img);
  endif
endfunction

function m = adj_m(x1, y1, x2, y2, img)
  m = vizinho(x1, y1, x2, y2, 4) || (vizinho(x1, y1, x2, y2, 'd') && intersec(x1, y1, x2, y2, img));
endfunction

function oito = adj_8(x1, y1, x2, y2, img)
  oito = vizinho(x1, y1, x2, y2, 8) && (img(x1, y1) == img(x2, y2));
endfunction

function quatro = adj_4(x1, y1, x2, y2, img)
  quatro = vizinho(x1, y1, x2, y2, 4) && (img(x1, y1) == img(x2, y2));
endfunction

function inter = intersec(x1, y1, x2, y2, img)
    inter = false;
    emcima = (x1 - x2) < 0;
    if(emcima)
      paradireita = (y1 - y2) < 0;
      if(paradireita)
        inter = (img(x1,y1) != img(x1+1, y1)) && (img(x1,y1) != img(x1, y1+1));
      endif
      if(!paradireita)
        inter = (img(x1,y1) != img(x1-1, y1)) && (img(x1,y1) != img(x1, y1+1));
      endif
    endif
    if(!emcima)
      paradireita = (y1 - y2) < 0;
      if(paradireita)
        inter = (img(x1,y1) != img(x1-1, y1)) && (img(x1,y1) != img(x1, y1+1));
      endif
      if(!paradireita)
        inter = (img(x1,y1) != img(x1-1, y1)) && (img(x1,y1) != img(x1, y1-1));
      endif
    endif
endfunction