function [sol] = hsvHistogram(path_to_image, count_bins)
  
  %citesc imaginea sub forma de matrice tridimensionala
  image = imread(path_to_image);
  
  newimage = rgbHsvTransform(image);
  
  %initializez fiecare vector
  countH = zeros(1,count_bins);
  countS = zeros(1,count_bins);
  countV = zeros(1,count_bins);
  
  %schimb forma matricei in vector
  H = reshape(newimage(:,:,1),1,[]);
  S = reshape(newimage(:,:,2),1,[]);
  V = reshape(newimage(:,:,3),1,[]);
    
  %stabilesc intervalele dintre puncte
  range = 0:(1.01/count_bins):1.01;
  
  %numar punctele pentru fiecare interval, pentru fiecare culoare
  countH = histc(H,range);
  countS = histc(S,range);
  countV = histc(V,range);
  
  %elimin ultimul interval(de dupa ultimul punct)
  countH(end) = [];
  countS(end) = [];
  countV(end) = [];

  %concatenez vectorii aferenti fiecarei culori
  sol = [countH countS countV];

end