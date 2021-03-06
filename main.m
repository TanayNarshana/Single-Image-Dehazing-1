% Single Image Haze Removal Using Dark Channel Prior
% Based on Paper of Kaiming He, Jian Sun and Xiaoou Tan in CVPR 2009
% Implementation by Tanay Narshana, 2015eeb1076, IIT Ropar
% Link to the paper: http://kaiminghe.com/publications/cvpr09.pdf
close all;
clear;
clc;

patchSizeC = 15; %Columns
patchSizeR = 15; %Rows
omega=0.95;
t0=0.1;

I = imread('img.jpg');
figure('Name','Input Image','NumberTitle','off');
imshow(I);

[ J,darkChannel, A, T ] = HazeRemoval(I,patchSizeC,patchSizeR,omega,t0);
figure('Name','Output Image','NumberTitle','off');
imshow(J,[]);
imwrite(J,'output.jpg');