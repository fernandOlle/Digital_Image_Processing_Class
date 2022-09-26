function [x y] = transf_afim(v, w, T)
  m_input = [v w 1];
  % faz transformacao e retorna o ponto
  m_output = m_input * T;
  x = m_output(1);
  y = m_output(2);
endfunction
