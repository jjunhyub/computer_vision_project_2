
addpath('/ransac_homography/');  
pic1 = imread('pic1.png');
pic2 = imread('pic2.png');
pnum = 4;
psize = size(pic1);
point1  = [23,24 ;200,24;23,337;200,337]'; % source
point2  = [20,100;171,94;34,222;166,210]'; % target

[H,~] = findHomography(point2,point1);
H = H';
figure(2);
H_inv = inv(H);
tform = projective2d(H_inv);
warped_pic1 = imwarp(pic1,tform);
imshow(warped_pic1);
2;

% for cnt1 = 1:pnum
%     tpoint = [point1(:,cnt1);1];
%     tmp = H\tpoint;
%     tmp = tmp/tmp(end);
%     plot(tmp(1),tmp(2),'.');
%     hold on;
% end