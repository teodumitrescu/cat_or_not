function [sol] = rgbHistogram(path_to_image, count_bins)
 
  %citesc imaginea sub forma de matrice tridimensionala
  image = imread(path_to_image);

  %initializez fiecare vector
  countR = zeros(1,count_bins);
  countG = zeros(1,count_bins);
  countB = zeros(1,count_bins);
  
  %schimb forma matricei in vector
  R = reshape(image(:,:,1),1,[]);
  G = reshape(image(:,:,2),1,[]);
  B = reshape(image(:,:,3),1,[]);
    
  %stabilesc intervalele dintre puncte
  range = 0:(256/count_bins):256;
  
  %numar punctele pentru fiecare interval, pentru fiecare culoare
  countR = histc(R,range);
  countG = histc(G,range);
  countB = histc(B,range);
  
  %elimin ultimul interval(de dupa ultimul punct)
  countR(end) = [];
  countG(end) = [];
  countB(end) = [];

  %concatenez vectorii aferenti fiecarei culori
  sol = [countR countG countB];
 
end