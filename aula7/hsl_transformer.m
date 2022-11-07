function imagemSaida = hsl_transformer (imagemHSL, canal)
% extrai o canal, coloca de volta para RGB e retorna a imagem

    imagemHSL(:,:,canal) = imagemHSL(:,:,canal) .* 0.5;
    imagemSaida = hsv2rgb(imagemHSL);
    figure, imshow(imagemSaida);
endfunction
