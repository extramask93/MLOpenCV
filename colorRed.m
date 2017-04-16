function lab2
    clear;
    clc;
    im = 256*(~imread('duck.BMP'));
    
    edges = edge(im);
    image(edges);
    colormap(gray(2));

function reduced = reduceGray(im, colorCnt)
    div = 256/colorCnt;
    reduced = zeros(size(im));
    for x = 1:size(im, 1)
        for y = 1:size(im, 2)
            reduced(x,y) = uint8(div*floor(im(x,y)/div));
        end
    end

function reduced = reduceRGB(im, colorsR, colorsG, colorsB)
    R = reduceGray(im(:,:,1), colorsR);
    G = reduceGray(im(:,:,2), colorsG);
    B = reduceGray(im(:,:,3), colorsB);
    reduced(:,:,1) = R/256;
    reduced(:,:,2) = G/256;
    reduced(:,:,3) = B/256;

function out = erode(im)
    out = zeros(size(im));
    for i = 2:size(im,1)-1
        for j = 2:size(im,2)-1
            out(i,j) = 256*min(min(im(i-1:i+1, j-1:j+1)));
        end
    end
    
function out = dilate(im)
    out = zeros(size(im));
    for i = 2:size(im,1)-1
        for j = 2:size(im,2)-1
            out(i,j) = max(max(im(i-1:i+1, j-1:j+1)));
        end
    end
    
function out = opening(im)
    out = erode(dilate(im));

function out = closing(im)
    out = dilate(erode(im));

function out = edge(im)
    out = xor(im, erode(im));