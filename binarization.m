clear;
clc;

im = imread('lena.png');
R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);

% R
subplot(5,3,1);
hist(R(:),1:255);
colormap(gray(256));
title('R');
axis off;

% G
subplot(5,3,2);
hist(G(:),1:255);
colormap(gray(256));
title('G');
axis off;

% B
subplot(5,3,3);
hist(B(:),1:255);
colormap(gray(256));
title('B');
axis off;

% R cum
subplot(5,3,4);
h = cumsum(hist(R(:), 1:255));
bar(h);
title('R cumulative');
axis off;

% G cum
subplot(5,3,5);
h = cumsum(hist(G(:), 1:255));
bar(h);
title('G cumulative');
axis off;

% B cum
subplot(5,3,6);
h = cumsum(hist(B(:), 1:255));
bar(h);
title('B cumulative');
axis off;

% Smooth R
subplot(5,3,7);
smR = medfilt1(hist(R(:),1:255));
bar(smR);
axis off;

% Smooth G
subplot(5,3,8);
smG = medfilt1(hist(G(:),1:255));
bar(smG);
axis off;

% Smooth B
subplot(5,3,9);
smB = medfilt1(hist(B(:),1:255));
bar(smB);
axis off;

% Obraz
subplot(5,3,10);
image(im);
title('Image');
axis off;

% Szary
subplot(5,3,11);
for i = 1:size(im,1)
    for j = 1:size(im,2);
        gr(i,j) = mean(im(i,j));
    end
end
colormap(gray(256));
image(gr);
title('Grayscale - mean');
axis off;

% Binaryzacja
subplot(5,3,12);
title('Binary - G');
cvbin = cv.threshold(G,'auto','Method','Binary');
image(255*cvbin);
