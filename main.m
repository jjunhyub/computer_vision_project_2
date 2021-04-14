clear;clc;close all;

addpath('ransac_homography/');  
pic1 = imread('pic1.png');
pic2 = imread('pic2.png');
pnum = 4;
psize = size(pic1);
% point1  = [23,24 ;200,24;23,337;200,337]'; % source
% point2  = [20,100;171,94;34,222;166,210]'; % target

pic1_cut = pic1(24:337,23:200,:);

point1  = [1,1 ;178,1,;1,314;178,314]'; % source
point2  = [20,100;171,94;34,222;166,210]'; % target

[H,~] = findHomography(point2,point1);
H_inv = inv(H);

% 
figure(1);
tform = projective2d(H_inv);
[warped_pic1,w] = imwarp(pic1_cut,tform,'linear');
imshow(warped_pic1);



2;
warp(pic2, pic1_cut, H_inv);

