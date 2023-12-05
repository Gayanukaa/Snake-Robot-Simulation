clc;
clear;
close all;

%% face detect
% [file,path]=uigetfile('*.*','Select an image');
% loc=strcat(path,file);
% pic=imread(loc);
% pic2=rgb2gray(pic);
% %face
% ff=vision.CascadeObjectDetector();
% ff.MergeThreshold = 50;
% bbox=step(ff,pic2);
% dd=insertObjectAnnotation(pic,'Rectangle',bbox,'Face');
% pts=detectMinEigenFeatures(pic2,'ROI',bbox);
% dd = insertMarker(dd,pts,'+','color','green');
% imshow(dd);hold on
% plot(pts.Location(:,1),pts.Location(:,2));
% hold off

%% Real-time face detection
clc;close all;
% clear('li');
li=webcam();
im=snapshot(li);
dete=vision.CascadeObjectDetector('Mouth','MergeThreshold',100);
pp=imshow(im);
while true
    im=snapshot(li);
    im2=rgb2gray(im);
    bb=step(dete,im2);
    im2=insertObjectAnnotation(im,'rectangle',bb,'Face');
    imshow(im2);
end