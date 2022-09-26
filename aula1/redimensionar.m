function retval = redimensionar (arquivo1, tipo, num1, num2)
  img = imread(arquivo1);  
  img = img(:,:,1); % recorta canal de cores
  
  [V H]=size(img);      %extrai as dimens�es da imagem origem
  imshow(img);
  oV = floor(num1 * V); %calcula dimens�es da imgem destino
  oH = floor(num2 * H);
  o = zeros(oV, oH);  %cria a matriz para imagem destino
  img(:,H+1)=img(:,H);    %aumenta imagem origem duplicando as bordas
  img(V+1,:)=img(V,:);
  img = double(img);      %tranforma tipo de dados da imagem origem para double  

  if(tipo == 1) % vizinho mais proximo
    for (m = 1:oV)      
        for (n = 1:oH)
            k = floor(((m-1)/num1))+1;    % pega os vizinhos
            l = floor(((n-1)/num2))+1;
            o(m, n) = img(k,l); % coloca na image de saida 
        end
    end
  elseif (tipo == 2) % bilinear
    for (m = 1:oV)      
        for (n = 1:oH)
            k = floor(((m-1)/num1))+1;    % pega os vizinhos
            l = floor(((n-1)/num2))+1;
            dy = (((m-1)/num1))+1 - k;    % calcula fraçao vertical
            dx = (((n-1)/num2))+1 - l;    % calcula fraçao horizontal
            d1 = (1-dx)*img(k,l) + dx*img(k,l+1);       % interpolacao vertical
            d2 = (1-dx)*img(k+1,l) + dx*img(k+1,l+1);   % interpolacao vertical'
            r = (1-dy)*d1 + dy*d2;                  % interpolacao horizontal
            o(m,n) = r; % coloca na imagem de saida 
        end
    end
   end

  name = strcat('out_', arquivo1);   
  figure;
  imshow(o,[]);    
  img = o;            
  imwrite(o, name);
  retval = name;
  
endfunction
