function [newimg] = rgbHsvTransform(image)
  
  %schimb tipul elementelor din matrice 
  image = double(image);
  [rows, columns, dim] = size(image);
 
  %algoritmul este vectorizat, lucrez simultan cu toti pixelii din fiecare
  %dimensiune
  R = image(:,:,1)/255;
  G = image(:,:,2)/255;
  B = image(:,:,3)/255;
  
  [rows,columns] = size(R);
  
  Cmax = max(R, G);
  Cmax = max(Cmax, B);
  
  Cmin = min(R, G);
  Cmin = min(Cmin, B);
  
  delta = Cmax - Cmin;
  
  H = zeros(rows,columns);
  
  delta(delta == 0) = 1;
  
  %iau simultan doar pixelii care indeplinesc conditia necesara
  H(Cmax == R) = 60*mod((G(Cmax == R) - B(Cmax == R))./(delta(Cmax == R)),6);
  H(Cmax == G) = 60*((B(Cmax == G) - R(Cmax == G))./(delta(Cmax == G)) + 2);
  H(Cmax == B) = 60*((R(Cmax == B) - G(Cmax == B))./(delta(Cmax == B)) + 4);
  
  S = zeros(rows,columns);
  S(Cmax != 0) = delta(Cmax != 0).*(Cmax(Cmax !=0).^(-1));
  
  V = Cmax;
  
  H = H/360;
  
  %pun noile matrici obtinute in locul celor RGB initiale
  newimg(:,:,1) = H;
  newimg(:,:,2) = S;
  newimg(:,:,3) = V;
endfunction
  
  