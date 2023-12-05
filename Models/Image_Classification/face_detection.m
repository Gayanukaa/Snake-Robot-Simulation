clc;
clear;
close all;

%% face detect
[file,path]=uigetfile('*.*','Select an image');
loc=strcat(path,file);
pic=imread(loc);
pic2=rgb2gray(pic);
%face
ff=vision.CascadeObjectDetector();
bbox=step(ff,pic2);
dd=insertObjectAnnotation(pic,'Rectangle',bbox,'Face');
pts=detectMinEigenFeatures(pic2,'ROI',bbox);
dd = insertMarker(dd,pts,'+','color','green');
imshow(dd);hold on
plot(pts.Location(:,1),pts.Location(:,2));
hold off