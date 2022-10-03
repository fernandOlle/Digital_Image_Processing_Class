% 3x3
f = [1,1,1;1,1,1;1,1,1];
filtragem('barbara_gray.bmp', f);

% 7x7
f = [1,1,1,1,1,1,1; 1,1,1,1,1,1,1; 1,1,1,1,1,1,1;  1,1,1,1,1,1,1; 1,1,1,1,1,1,1; 1,1,1,1,1,1,1;  1,1,1,1,1,1,1];
filtragem('barbara_gray.bmp', f);

% descrito abaixo
f = [1,2,1;2,4,2;1,2,1];
filtragem('barbara_gray.bmp', f);

% filtros de realce
f = [-1,-1,-1; -1,9,-1; -1,-1,-1];
filtragem('barbara_gray.bmp', f);

f = [0,1,0;1,-4,1;0,1,0];
filtragem('barbara_gray.bmp', f);

f = [1,1,1;1,-8,1;1,1,1];
filtragem('barbara_gray.bmp', f);