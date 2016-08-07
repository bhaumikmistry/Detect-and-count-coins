% Labeling of objects in an image using segmentation.

close all;

%% read image
A = imread('image1.jpg');
figure, imshow(A);
title('Original Image');




%% Make it black and white
B= im2bw(A);
figure,imshow(B);
title('Black and white image');

%% Filling the holes to get a clear white mask to count
c = imfill(B,'holes');
figure,imshow(c);

%% labels are givne to all the group of pixels
label =bwlabel(c);
max(max(label))

%% for loop to extract the image from the main image.
for j = 1: max(max(label))
    [row, col] = find(label == j);
    
    len = max(row)- min(row)+2;
    bre = max(col)- min(col)+2;
    
    if (len >= 25 && bre >= 25)
    target = uint8(zeros([len bre]));
    sy = min(col)-1;
    sx = min(row)-1;
    
    for i = 1 : size(row,1)
        x = row(i,1)-sx;
        y = col(i,1)-sy;
        target(x,y) = A(row(i,1),col(i,1));
    end
    
    
    
    mytitle = strcat('Object Number:' ,num2str(j));
    figure,imshow(target);title(mytitle);
    end
end



        
