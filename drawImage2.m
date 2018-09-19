I = imread(uigetfile);

BW1 = edge(I,'Canny');


imshow(BW1)