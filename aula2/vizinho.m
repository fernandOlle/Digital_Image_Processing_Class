function viz_sim_nao = vizinho(x1, y1, x2, y2, modelo)
  if (modelo == 4)
    viz_sim_nao = viz_4(x1, y1, x2, y2);
  elseif(modelo == 8)
    viz_sim_nao = viz_8(x1, y1, x2, y2);
  elseif(modelo == 'd')
    viz_sim_nao = viz_d(x1, y1, x2, y2);
  endif
endfunction

function retval = viz_4(x1, y1, x2, y2)
  retval = false;
  if (x1 == x2 && (y1 == y2+1 || y1+1 == y2)) 
    retval = true;
  elseif(y1 == y2 && (x1 == x2+1 || x1+1 == x2)) 
    retval = true;
  endif
endfunction

function retval = viz_8(x1, y1, x2, y2)
  retval = false;
  if (viz_4(x1, y1, x2, y2))
    retval = true;
  elseif (viz_d(x1, y1, x2, y2))
    retval = true;
  endif
endfunction

function retval = viz_d(x1, y1, x2, y2)
  retval = false;
  if ((x1 == x2-1 || x1 == x2+1) && (y1 == y2-1 || y1 == y2+1)) 
    retval = true;
  endif
endfunction