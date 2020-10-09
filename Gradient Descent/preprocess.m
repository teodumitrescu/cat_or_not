function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  
  %creez path-ul catre cele doua foldere de la adresa respectiva
  catsfolder = strcat(path_to_dataset,  'cats/');
  notcatsfolder = strcat(path_to_dataset,  'not_cats/');
  
  %formez doua matrici cu numele imaginilor din foldere
  catsimgs = getImgNames(catsfolder);
  notcatsimgs = getImgNames(notcatsfolder);
 
  numcats = size(catsimgs,1);
  numnotcats = size(notcatsimgs,1);

  X = zeros(numcats+numnotcats, count_bins*3);
  y = zeros(numcats+numnotcats,1);
  
  %parcurg fiecare matice cu nume de imagini
  for i = 1:numcats
    catpath = strcat(catsfolder,catsimgs(i,:));
    %adaug valoarea 1 pentru cats in vectorul y
    y(i) = 1;
    %calculez histograma dorita si o adaug in matricea de caracteristici
    if histogram == "RGB"
      X(i,:) = rgbHistogram(catpath,count_bins);
    endif
    if histogram == "HSV"
      X(i,:) = hsvHistogram(catpath,count_bins);
    endif
  endfor
  
  for j = 1:numnotcats
    notcatpath = strcat(notcatsfolder,notcatsimgs(j,:));
    y(j+numcats) = -1;
    if histogram == "RGB"
      X(j+numcats,:) = rgbHistogram(notcatpath,count_bins);
    endif
    if histogram == "HSV"
      X(j+numcats,:) = hsvHistogram(notcatpath,count_bins);
    endif
  endfor
 
endfunction
